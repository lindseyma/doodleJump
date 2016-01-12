class Doodle{
  
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
        
        
        void display(){
          
          chara = loadImage("doodle_left.png");
          chara.resize(50,50);
          charaRight = loadImage("doodle_right.png");
          charaRight.resize(50,50);
          
          image (chara, x, y);
          image (charaRight, x, y);
          
          
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
