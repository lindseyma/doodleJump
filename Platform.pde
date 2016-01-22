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

class hPlat extends Platform{
  
  hPlat(float platX, float platY){
    super(platX, platY);
  }
  
}

class vPlat extends Platform{
  
  vPlat(float platX, float platY){
    super(platX, platY);
  }
  
}