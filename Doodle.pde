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
        //println("test");
       // println(mouseX + " : " + mouseY);
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
        }
               
    }
    