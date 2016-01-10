PImage img;
PImage htpbutton;
PImage playbutton;
PImage playonbutton;

String screen = "menu";

void show(){
     if (screen == "menu"){
       displayMenu();
     }
}
 void setup(){
      size (320, 480);
        /*img = loadImage ("doodle jump title screen.png");
        playbutton = loadImage("play.png");
        playonbutton = loadImage("play-on.png");*/
      }          
        
        void draw(){
          /*image (img, 0, 0);
          image (playbutton, 82, 190);
          
            if (mouseX == 82 && mouseY == 190) 
              {startgame();}
          
        println(mouseX + " : " + mouseY);*/
        show();
      }
      
    void displayMenu(){
        img = loadImage ("doodle jump title screen.png");
        playbutton = loadImage("play.png");
        playonbutton = loadImage("play-on.png");
        image (img, 0, 0);
          image (playbutton, 82, 190);
          
            if (mouseX == 82 && mouseY == 190) 
              {startgame();}
          
        println(mouseX + " : " + mouseY);
    }
    
    void startgame(){
      image (playonbutton, 82, 190);
    }
  
  
  /*void setup(){
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
}*/