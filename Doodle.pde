class Doodle{
        
         float x;
         float y;
         float velX;
         
        Doodle(float x, float y){
            this.x=x;
            this.y=y;
        }
            
        void display(){
        rect(x, y, 30, 30);
         if(left){
              x-=1;
            }
            if(right){
              x+=1;
            }
        }
     
       boolean left; boolean right;
       
       void keyPressed(){
           if(key=='a'){ 
             left = true;
           }
           if(key=='d'){
             right = true;
           }
       }
       
       void move(){
            if(left){
              x-=1;
            }
            if(right){
              x+=1;
            }
        }
               
    }
    