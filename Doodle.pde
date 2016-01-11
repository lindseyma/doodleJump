class Doodle{
        
         float x;
         float y;
         float velX;
         
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
        println(x + "," + y);
        
        /*////////////////////////////////////////////////////////////////////////Y
        float yVel;
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