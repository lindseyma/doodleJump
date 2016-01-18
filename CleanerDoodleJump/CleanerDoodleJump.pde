//variables for diff screens
// 0: initial
// 1: gameplay
// 2: game-over

int gameScreen = 0;
Doodle chara;

//setup
void setup(){
  size(320, 480);
  chara = new Doodle(135, 430);
<<<<<<< HEAD
  frameRate(30);
=======
>>>>>>> 304cf37a9607df58fa5c5ec8f21e525f10dc3248
  initPlatSetup();
}

//draw

void draw(){
  println("charCoord" + chara.getX() + "," + chara.getY());
  println(platforms.get(0).getX() + "," + platforms.get(0).getY());
   if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
  //println("charCoord" + chara.getX() + "," + chara.getY());
  //println(platforms.get(0).getX() + "," + platforms.get(0).getY());
  //println(chara.getYVel());
}

//screen contents
PImage bg;
PImage playbutton;
PImage playonbutton;

void initScreen() {
  // codes of initial screen
  bg = loadImage ("doodle jump title screen.png");
  playbutton = loadImage("play.png");
  playonbutton = loadImage("play-on.png");
  
  background(bg);
  image (playbutton, 82, 190);
  
  if (mouseX > 82 && 
      mouseX < 913 && 
      mouseY > 194 &&
      mouseY < 232){
  image (playonbutton, 82, 190);
  }
}

void gameScreen() {
  // codes of gameplay screen
  bg = loadImage ("background.png");
  bg.resize(320, 480);
  background(bg);
  
  chara.display();
  //chara.gravity();
  chara.movement();
  
<<<<<<< HEAD

=======
>>>>>>> 304cf37a9607df58fa5c5ec8f21e525f10dc3248
   display();
   if(chara.getY() <= height/2){
     platScroll();
   }
   intersect();
<<<<<<< HEAD
=======
   cleanUp();
   
>>>>>>> 304cf37a9607df58fa5c5ec8f21e525f10dc3248
}
void gameOverScreen() {
  // codes for game over screen
}

//inputs
void mousePressed(){
  if (mouseX > 82 &&
      mouseX < 193 && 
      mouseY > 194 && 
      mouseY < 232 &&
      gameScreen==0){
     startGame();
      }
}

void keyPressed(){
  if (key == 'a'){
    chara.left = 1;
    chara.flip = false;
  }
  
  if (key == 'd'){
    chara.right = 1;
    chara.flip = true;
  }
}

void keyReleased(){
  if (key == 'a'){
    chara.left = 0;
  }
  
  if (key == 'd'){
    chara.right = 0;
  }
  
}

//platform stuff

ArrayList<Platform> platforms= new ArrayList<Platform>();

PImage green;

float platfX;
float platfY;
    
   void initPlatSetup(){
<<<<<<< HEAD
     
     green = loadImage("green_platform.png");
     green.resize(45,11);
     
     
     int initPlat = int(random(3,7));
     int sectionSize = height/initPlat;
     
     for(int i=0; i<initPlat; i++){
=======
     platforms.add(new Platform(135, 430));
     int initPlat = int(random(3,7));
     int sectionSize = height/initPlat;
     for(int i=1; i<initPlat; i++){
>>>>>>> 304cf37a9607df58fa5c5ec8f21e525f10dc3248
        platfX = random(0, width);
        platfY = random(sectionSize*i, sectionSize*(i+1));
        platforms.add(new Platform(platfX, platfY));
     }//for i
   }
  
   
   void display(){
     
      for(int i=0; i<platforms.size(); i++){
         image (green, platforms.get(i).getX(), platforms.get(i).getY());
      }

/*
     for(int i=0; i<platforms.size(); i++){
         line(platforms.get(i).getX(), platforms.get(i).getY(), (platforms.get(i).getX())+35, platforms.get(i).getY());   
       }
       */
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
  
  void cleanUp(){
    for(int i=0; i<platforms.size(); i++){
      if (platforms.get(i).getY()>height){
        platforms.remove(i);
        i--;
      }
    }
  }
    
  void newPlats(){
    /*boolean replacePlat;
    if(((int)random(1,2)) % 2 == 0){
      replacePlat = true;
    }//if to assign replacePlat
    //if (replacePlat){*/
    platforms.add(new Platform((float)(random(0, width - 35)), -1));
    }
    
  //float newPX = random(0, width);
  //float newPY = random(0, (height/2));

   void intersect(){
      for(int i=0; i<platforms.size(); i++){
        if((platforms.get(i).getX() >= chara.getX() &&
           platforms.get(i).getX() + 35 >= chara.getX()) &&
           (platforms.get(i).getY() >= chara.getY() &&
           platforms.get(i).getY() - 3 <= chara.getY()) &&
           chara.getYVel() > 0) { //this checks that the player is falling down
             chara.setY(-8);
             println("charCoord" + chara.getX() + "," + chara.getY());
             println(platforms.get(i).getX() + "," + platforms.get(i).getY());
             //println(chara.getYVel());
        }//if
     }//for
  }//intersect

//determine which screen gets set
void startGame(){
  gameScreen = 1;
}