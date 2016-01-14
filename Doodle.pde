class Doodle {
         float gravity = .8;
         float speed = 0;
         
         float velY;
         float time;
         float newTime;
  
         PImage chara;
         PImage charaRight;
        
         float x;
         float y;
         float velX = 5;
         
        Doodle(float x, float y){
            this.x=x;
            this.y=y;
        }
          
       boolean left; boolean right;
       boolean flip;
        
        
        void display(){
          
          chara = loadImage("doodle_left.png");
          chara.resize(50,50);
          charaRight = loadImage("doodle_right.png");
          charaRight.resize(50,50);
          
          
          if (flip){
            image (charaRight, x, y);
          }else{
            image (chara, x, y);
          }
         
          
        //////////////////////////////////////////////////////////////////X
        //println("test");
       // println(mouseX + " : " + mouseY);
       //println(frameCount); ~20 framecounts = one jump?
        if (keyPressed){
           //println("hey");
           if(key=='a'){ 
             left = true;
             flip = false;
          
           }
           if(key=='d'){
             right = true;
             flip = true;
         
           }
        }
        if(keyPressed==false){
          left=false;
          right=false;
        }
      
        println(left);
         if(left){
              x-=20;
       
            }
            if(right){
              x+=20;
             
              
            }         
            
            
         //wrapping ayy
         if(x>320){
           float temp = x - 320;
           x = temp;
         }
         if(x<0){
           float temp = 0 - x;
           x= 320 - temp;
         }
        println(x + "," + y);
        
        
        //gravity part
        
        y = y + speed;
        speed = speed + gravity;
        
        //make chara stop at bottom, prob need to adjust for platforms later
        
        
        ////////////////////////////////////////////////////////////////////////Y
        //formulas !!!
        //h = 1/2 gt^2
        //v^2=2gh
        //v=gt
       /* while(velY>0){
          if(y==450){ //keep in mind this y-coord is only for now to test the physics
             velY=10;
             time=millis();
          }
          y-=velY;
        }*/
        
        /*float yVel;
        float gravity = 0.000000000000000000000000000000000000000000001;
        float currentFrame=frameRate;
        yVel=0; // in later versions, start the jump when yvel is 0??
        if(yVel==0){
            float temp=yVel;
            yVel= temp + gravity * (frameRate-currentFrame);
        }
        float tempY = y;
        y+=tempY + yVel * (frameRate-currentFrame);*/
               
    }
    
    //if velocity is negative and doodle coordinate = platform coord, jump.
    

}


/*void move(){
  x+=dx;
  y+=dy;
}

public void gravity(){
  dy-=-0.2;
}
*/
