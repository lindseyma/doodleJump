PImage img;
PImage htpbutton;
PImage playbutton;
PImage playonbutton;
String screen = "menu";//default is menu
ArrayList<Platform> platforms= new ArrayList<Platform>();


 void setup(){
      size (320, 480);
      initPlatSetup();
 }

void show(){
     if (screen == "menu"){
       displayMenu();
     }
     if (screen == "game"){
       startGame();
     }
    }//show calls the right method for each display

Doodle d= new Doodle(135, 0);

void draw(){
    show();
    println(platforms.size());
}

    void displayMenu(){
        img = loadImage ("doodle jump title screen.png");
        playbutton = loadImage("play.png");
        playonbutton = loadImage("play-on.png");
        //image (img, 0, 0);
        background(img);
          image (playbutton, 82, 190);
          
          if (mouseX > 82 && mouseX < 913 && mouseY > 194 && mouseY < 232){
            image (playonbutton, 82, 190);
          }
          
            if (mousePressed && mouseX > 82 && mouseX < 193 && mouseY > 194 && mouseY < 232){
  
                screen="game";
            }//if play button
          
        //println(mouseX + " : " + mouseY);
        //println(screen);
    }
    
    void startGame(){
      img = loadImage ("background.png");
      img.resize(320,480);
      background(img);
      d.display();
      display();
      if(d.getY() <= height/2){
        platScroll();
      }
    }
    
   float platfX;
   float platfY;
    
   void initPlatSetup(){
     int initPlat = int(random(3,7));
     int sectionSize = height/initPlat;
     for(int i=0; i<initPlat; i++){
        platfX = random(0, width);
        platfY = random(sectionSize*i, sectionSize*(i+1));
        platforms.add(new Platform(platfX, platfY));
     }//for i
   }
   
   void display(){
     for(int i=0; i<platforms.size(); i++){
         line(platforms.get(i).getX(), platforms.get(i).getY(), (platforms.get(i).getX())+35, platforms.get(i).getY());   
       }
   }
   
   void platScroll(){
     for(int i=0; i<platforms.size(); i++){
       platforms.get(i).changeY(platforms.get(i).getY()+10);
       if (platforms.get(i).getY()>height){
         platforms.remove(i);
         i--;
         newPlats();
       }
     }
   }
  
  void newPlats(){
    /*boolean replacePlat;
    if(((int)random(1,2)) % 2 == 0){
      replacePlat = true;
    }//if to assign replacePlat
    //if (replacePlat){*/
    platforms.add(new Platform((float)(random(0, width)), -1));
    }
    
  //float newPX = random(0, width);
  //float newPY = random(0, (height/2));