class Doodle{
  
  float x;
  float y;
  
  //constructor
 Doodle(float x, float y){
   this.x=x;
   this.y=y;
 }  
 
 PImage chara;
 PImage charaRight;
 boolean flip;
 
 //show doodle
 void display(){
   chara = loadImage("doodle_left.png");
 
   charaRight = loadImage("doodle_right.png");
   
   if (flip){
     image (charaRight, x, y);
   } else {
     image (chara, x, y);
   }
     
   
   if(x>320){
     float temp = x - 320;
     x = temp;
   }
  if(x<0){
     float temp = 0 - x;
     x= 320 - temp;
   }
 }
 
 //movement
 float xspeed = 10.0;
 float left;
 float right; 
 //float up;
 float smoothen = .001;
 
 void movement(){
   x += (right - left) * xspeed;   
   x -= (right - left) * (xspeed * smoothen);
   //y += up * 30;
   y+=yVel;
   yVel += gravity;
   yVel = min(yVel, maxY);
   yVel = max(yVel, -maxY);
 }
 
 //gravity
 float yVel;
 float maxY = 10; //at this point, the player would go back down
 float gravity = .3;
 //float airfriction = .001;
 
 
 /*void gravity(){
   y += yVel;
   yVel += gravity;
   yVel -= (yVel * airfriction);
 }*/
 
 
 //accessor and set methods ayy//////////////////
 float getY(){
          return y;
        }
 
 float getX(){
   return x;
 }
 
 float getYVel(){
   return yVel;
 }
 
 void setY(float newY){
   yVel = newY;
 }
}