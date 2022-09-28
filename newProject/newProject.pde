String screen = "food selecting";
int mouse_int, move_int, feet, jump_int, obstacle_eat_int1, obstacle_eat_int2;
int keynumber = 0; int key_int = 0; int shark_int = 0;
float total_cal;
float acc = 0; float sharkxpos = 0;
food food_ham, food_chi, food_piz;
dieter runner, swimmer;
obstacle o1,o2,o3;
PVector back = new PVector(0, 0);
import ddf.minim.*;
Minim minim;
AudioPlayer audio_opening, audio_running, audio_swimming, audio_fall, audio_end, audio_ending;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(1000, 400);
  move_int = 0; feet = 0; jump_int = 0; obstacle_eat_int1 = 0; obstacle_eat_int2 = 0;
  food_ham = new food(1.5*width/6, height/3.5, "hamburger", 350);
  food_chi = new food(3*width/6, height/3.5, "chicken", 500);
  food_piz = new food(4.5*width/6, height/3.5, "pizza", 600);
  runner = new dieter("run", width/2, height/2);
  swimmer = new dieter("swim", width/2, height/2);
  o1 = new obstacle(700, height/2);
  o2 = new obstacle(1000, height/2);
  o3 = new obstacle(1500, height/2);
  minim = new Minim(this);
  audio_opening = minim.loadFile("opening.mp3");
  audio_running = minim.loadFile("running.wav");
  audio_swimming = minim.loadFile("swimming.wav");
  audio_fall = minim.loadFile("fall_1.wav");  
  audio_end = minim.loadFile("end sound.wav");  
  audio_ending = minim.loadFile("ending.wav");  

  audio_opening.loop();

}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw() {
println(move_int);
  if (screen=="food selecting"){

    background(203);
    total_cal = 0;
    food_ham.img();
    food_chi.img();
    food_piz.img();
    food_ham.mouse();
    food_chi.mouse();
    food_piz.mouse();
    //line(0,200,1000,200);
    imageMode(CENTER);
    image(loadImage("eating.png"), width/2, 330);
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (screen=="exercise selecting") {
    background(203);
    PImage running = loadImage("select_running.png");
    PImage swimming = loadImage("select_swimming.png");
    replay_function();
    imageMode(CENTER);
    image(running, 2*width/6, 200);
    imageMode(CENTER);
    image(swimming, 4*width/6, 200);
    if (mousePressed&&2*width/6-82<mouseX&&mouseX<2*width/6+82&&150<mouseY&&mouseY<230) screen = "running";
    if (mousePressed&&4*width/6-82<mouseX&&mouseX<4*width/6+82&&150<mouseY&&mouseY<230) screen = "swimming";
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (screen=="running") {
    audio_opening.pause();
    audio_running.play();    
    moving_function();
    imageMode(CORNER);
    image(loadImage("track.png"), back.x, back.y);
    imageMode(CENTER);
    runner.img();
    runner.jump();
    replay_function();
    calories_function();
    o1.hurdle(); o3.hurdle();
    if(o1.position.x+back.x>=runner.position.x-5&&o1.position.x+back.x<=runner.position.x+5&&runner.position.y>130){
      audio_fall.play();
      move_int = 2;
      }
     if(o3.position.x+back.x>=runner.position.x-5&&o3.position.x+back.x<=runner.position.x+5&&runner.position.y>130){
      audio_fall.play();
      move_int = 2;
      }
        if(move_int ==2){
        println(keynumber);
        if ((keyCode==LEFT)&&(key_int==0)) {keynumber++; key_int =1;}
        if ((keyCode==RIGHT)&&(key_int==1)) {keynumber++; key_int =0;}
        if(keynumber==20){move_int=1; keynumber = 0;}
      }
    o2.food("hamburger");
    if (o2.position.x+back.x>runner.position.x-15&&o2.position.x+back.x<runner.position.x+15&&runner.position.y>150) {
      obstacle_eat_int1 = 1;

  }
    if (total_cal==0) {
      screen = "ending";
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (screen=="swimming") {
    audio_opening.pause();
    if(move_int!=2){
    audio_swimming.play(); 
    }
    moving_function();
    imageMode(CORNER);
    image(loadImage("pool_track.png"), back.x, back.y);
    imageMode(CENTER);
    if(sharkxpos+back.x >= swimmer.position.x-20){shark_int=1;sharkxpos-=6;  audio_swimming.pause(); audio_end.play(); move_int = 2;}
    shark_function();
    swimmer.img();
    calories_function();
    replay_function();
    if (total_cal==0) {
      screen = "ending";
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (screen=="ending") {
    audio_running.pause();
    audio_swimming.pause();
    audio_ending.play();
    imageMode(CORNER);
    image(loadImage("end_background1.png"), 10, 0);
    replay_function();

  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
