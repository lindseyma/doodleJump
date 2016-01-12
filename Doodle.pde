class Doodle{
         float gravity = 10;
         float x;
         float y;
         float velX;
         float velY;
         float time;
         float newTime;
         
        Doodle(float x, float y){
            this.x=x;
            this.y=y;
        }
          
        boolean left; boolean right;
        
        
        void display(){
        //////////////////////////////////////////////////////////////////X
        //println("test");
       // println(mouseX + " : " + mouseY);
       //println(frameCount); ~20 framecounts = one jump?
        if (keyPressed){
           //println("hey");
           if(key=='a'){ 
             left = true;
           }
           if(key=='d'){
             right = true;
           }
        }
        if(keyPressed==false){
          left=false;
          right=false;
        }
       rect(x, y, 30, 30);
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

}


/*void move(){
  x+=dx;
  y+=dy;
}

public void gravity(){
  dy-=-0.2;
}
*/