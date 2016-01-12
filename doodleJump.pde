PImage img;
PImage htpbutton;
PImage playbutton;
PImage playonbutton;

String screen = "menu";//default is menu

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
    }
       

 
  /////////////These methods are commented but please don't delete them for now thanks!
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

    /*void startgame(){ 
      //wasn't sure if this method was still necessary but i didn't want to delete it until you took at look at it
      image (playonbutton, 82, 190);
    }*/
  
