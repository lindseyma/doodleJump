class Monster{
  
  float monX;
  float monY;
  
  Monster(float monX, float monY){
    this.monX = monX;
    this.monY = monY;
  }//constructor
  
  //accessor methods!
  float getX(){
    return monX;
  }
  
  float getY(){
    return monY;
  }
  
  //set methods 
  void setX(float newX){
    monX=newX;
  }
  
  void setY(float newY){
    monY=newY;
  }
  
}