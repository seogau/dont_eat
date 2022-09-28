class food {

  PImage ham, chi, piz;
  PVector position;
  float food_cal;
  String name;
  food(float x, float y, String food_name,float cal) {
    position = new PVector(x, y);
    food_cal = cal;
    name = food_name;    
  }
  void pos(float x,float y){
  position.x = x; position.y = y;
  }
    void img(){
    PImage food = loadImage(name+".png");
    imageMode(CENTER);
    image(food,position.x,position.y);
    }
    void mouse(){    
      if (mousePressed&&(dis(mouseX, mouseY, position.x,position.y)<=50)) {
        position.x=mouseX; 
        position.y=mouseY;
        if(position.x>width/2-50&&position.x<width/2+50&&position.y>320-80){
          total_cal = food_cal;
          screen="exercise selecting";
        }
      }
    }
}

class dieter{
PImage runner, swimmer;
PVector position;
String exercise;
int img_mode;
dieter(String exercise_mode, float x, float y){
exercise = exercise_mode;
position = new PVector(x, y);
}
  void img(){
  if(move_int ==0)img_mode=1;
  else if(move_int ==1)img_mode=2;
  else if(move_int ==2)img_mode=3;
  image(loadImage(exercise+img_mode+".png"),position.x,position.y);
  }
  void jump(){

  if(keyPressed){if(key==' ') jump_int = 1;}
    if(jump_int == 1){ back.x-=4; acc+=0.6; position.y+=-11+acc; if(position.y>=200) {acc = 0; jump_int = 0;}}   
  }
}

class obstacle {
PImage hurdle, obs_food;
PVector position;
 obstacle(float x, float y){
   position = new PVector(x, y);
 }
     void hurdle(){
       image(loadImage("hurdle.png"),position.x+back.x,position.y+30);

     }
     void food(String food){
       int ob_food_cal=0;
       if(food == "hamburger"){ob_food_cal = 350;}
       if(food == "chicken")  {ob_food_cal = 500;}
       if(food == "pizza")    {ob_food_cal = 600;}
       if(obstacle_eat_int1 == 0 && obstacle_eat_int2 == 0){
         image(loadImage(food+".png"),position.x+back.x,position.y+40,width/10,height/4);
         }
       if(obstacle_eat_int1 == 1 && obstacle_eat_int2 == 0){total_cal += ob_food_cal;                                  
                                 obstacle_eat_int1 = 0;
                                 obstacle_eat_int2 = 1;
                                }
       
     }
     
 }
