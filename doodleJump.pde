PImage img;

void setup(){
  size (320, 480);
  img = loadImage ("doodle jump title screen.png");
}

void draw(){
  image (img, 0, 0);
  
}


/*



void setup(){
      size(360,550);
      background(248,240,234);
      initialize();
}

void initialize(){
      //Doodle d= new Doodle(160,520);
      //d.display();
}

void draw(){
      Doodle d= new Doodle(160,520);
      d.display();
      d.move();
}
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
    
    */