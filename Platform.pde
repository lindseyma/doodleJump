class Platform{
  
   float platX;
   float platY;
   
   Platform(float platX, float platY){
      this.platX=platX;
      this.platY=platY;
   }
   
   //accessor methods//
   float getX(){
     return platX;
   }
   
   float getY(){
     return platY;
   }
   
   //change methods//
   void changeX(float newX){
     platX=newX;
   }
   
   void changeY(float newY){
     platY=newY;
   }  
}


class hPlat extends Platform implements moves{
  
  hPlat(float platX, float platY){
    super(platX, platY);
  }
  
  void move(){
    float platVel;
    if(platX >= width-55){ //this line will check if the plat is at the v end
      platVel = -5;
    }
    if(platX <= 10){
      platVel = 5;
    }
    platX += platVel;
  }
}

class vPlat extends Platform implements moves{
  
  vPlat(float platX, float platY){
    super(platX, platY);
  }
  
  void move(){
    float platVel;
    if(platX >= height-21){
      platVel = 5;
    }
    if(platX <= 21){
      platVel = -5;
    }
    platY += platVel;
  }
  

class Moves{
  
  void move();
  
}
}