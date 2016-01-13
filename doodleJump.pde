PImage img;
PImage htpbutton;
PImage playbutton;
PImage playonbutton;

String screen = "menu";//default is menu

/*void gameSetup(){
  if screen=="game"){
    int initPlat = int(random(3,7));
   int sectionSize = height/initPlat;
      for(int i=0; i<initPlat; i++){
        println(i + "," + initPlat);
        float platX = random(0, width);
        float platY = random(sectionSize*i, sectionSize*(i+1));
        line(platX, platY, platX+35, platY);
     }//for i
  }
}*/

void show(){
     if (screen == "menu"){
       displayMenu();
     }
     if (screen == "game"){
       startGame();
     }
}//show calls the right method for each display

Doodle d= new Doodle(135, 430);

 void setup(){
      size (320, 480);
        /*img = loadImage ("doodle jump title screen.png");
        playbutton = loadImage("play.png");
        playonbutton = loadImage("play-on.png");*/
      /*if (screen=="game"){
        Doodle d= new Doodle(width/2-15, height - 30);
      }*/
      //this is not the right place ay
     // if (screen=="game"){
    int initPlat = int(random(3,7));
   int sectionSize = height/initPlat;
      for(int i=0; i<initPlat; i++){
        println(i + "," + initPlat);
        float platX = random(0, width);
        float platY = random(sectionSize*i, sectionSize*(i+1));
        line(platX, platY, platX+35, platY);
     }//for i/*
  }
        
void draw(){
    show();
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
          
        println(mouseX + " : " + mouseY);
        println(screen);
    }
    
    void startGame(){
      img = loadImage ("background.png");
      img.resize(320,480);
      background(img);
      //moved line below to the setup
      //Doodle d= new Doodle(width/2-15, height - 30);
      d.display();
      boolean runOnce = true;
      if (runOnce){
        int initPlat = int(random(3,7));
   int sectionSize = height/initPlat;
      for(int i=0; i<initPlat; i++){
        println(i + "," + initPlat);
        float platX = random(0, width);
        float platY = random(sectionSize*i, sectionSize*(i+1));
        line(platX, platY, platX+35, platY);
     }//for i
     runOnce=false;
      }
        
    }
    
  