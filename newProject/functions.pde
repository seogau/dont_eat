float dis(float x1, float y1, float x2, float y2) {
  return sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
}

void moving_function() {
 if(jump_int==0){ 
  if ((keyCode==LEFT)&&(move_int==0)) {
    back.x-=10; 
    move_int =1; 
    total_cal-=5;
    feet++;
  }
  if ((keyCode==RIGHT)&&(move_int==1)) {
    back.x-=10; 
    move_int =0; 
    total_cal-=5;
    feet++;
  }
 } 
}

void calories_function() {
  PImage cal_bar = loadImage("cal_bar.png");
  imageMode(CENTER);
  image(cal_bar, width/2, 45);
  pushMatrix();
  fill(200, 0, 0);
  translate(335, 40);
  rectMode(CORNER);
  float rect_length = 485.0-feet*5*485.0/(total_cal+feet*5);
  rect(0, 0, rect_length, 10);
  popMatrix();
}

void replay_function() {

  PImage replay = loadImage("replay.png");
  if (screen!="ending") {
    pushMatrix();
    translate(6*width/7, height*6/7);
    imageMode(CENTER);
    image(replay, 80, 0);
    if (mousePressed&&dist(mouseX, mouseY, 6*width/7+81, height*6/7+3)<=65) {

      food_ham.pos(1.5*width/6, height/3.5);
      food_chi.pos(3*width/6, height/3.5);
      food_piz.pos(4.5*width/6, height/3.5);
      back.x=0; 
      feet=0;
      sharkxpos = 0;
      shark_int = 0;
      move_int =0;
      obstacle_eat_int1 = 0;
      obstacle_eat_int2 = 0;
      audio_opening.play();
      audio_end.pause();
      audio_running.pause();
      audio_swimming.pause();
      audio_opening.rewind();
      screen = "food selecting";

    }
    popMatrix();
  }
  if (screen=="ending") {
    pushMatrix();
    translate(width/2, 2*height/3);
    imageMode(CENTER);
    image(replay, 0, 0);
    if (mousePressed&&dist(mouseX, mouseY, width/2, 2*height/3)<=65) {
      screen = "food selecting";
      food_ham.pos(1.5*width/6, height/3.5);
      food_chi.pos(3*width/6, height/3.5);
      food_piz.pos(4.5*width/6, height/3.5);
      back.x=0; 
      feet=0;
      sharkxpos = 0;
      shark_int = 0;
      move_int =0;
      obstacle_eat_int1 = 0;
      obstacle_eat_int2 = 0;
      audio_opening.play();
      audio_running.pause();
      audio_swimming.pause();
      audio_end.pause();
      audio_opening.rewind();
      screen = "food selecting";
    }
    popMatrix();
  }
}

void shark_function(){

sharkxpos+=5;
PImage shark = loadImage("shark"+shark_int+".png");
image(shark,sharkxpos+back.x-40,height/2);

}
