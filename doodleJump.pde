//variables for diff screens
// 0: initial
// 1: gameplay
// 2: game-over

int gameScreen = 0;
Doodle chara;

//setup
void setup(){
  size(320, 480);
}

void gameSetup(){
  score = 0;
  chara = new Doodle(135, 330);
  initPlatSetup();
}

//draw
void draw(){
  //println("charCoord" + chara.getX() + "," + chara.getY());
  //println(platforms.get(0).getX() + "," + platforms.get(0).getY());
   if (gameScreen == 0) {
    initScreen();
  } 
  if (gameScreen == 1) {
    gameScreen();
  } 
  if (gameScreen == 2) {
    gameOverScreen();
  }
  //println("charCoord" + chara.getX() + "," + chara.getY());
  //println(platforms.get(0).getX() + "," + platforms.get(0).getY());
  //println(chara.getYVel());
  println(mouseX + ", " + mouseY);
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
  
  println(score);

  //println(score);
  // codes of gameplay screen
  bg = loadImage ("background.png");
  bg.resize(320, 480);
  background(bg);
 
  
   display();
   
   
   if(chara.y <= height/2){
     platScroll();
   }
  
   
  chara.display();
  //chara.gravity();
  chara.movement();
  

   cleanUp();
   
   if (chara.y > 480){
     gameScreen = 2;
   }
}

PImage gameover;
PImage playagainbutton;

void gameOverScreen() {
  // code for game over screen
  
  bg = loadImage ("background.png");
  bg.resize(320, 480);
  background(bg);
  
  gameover = loadImage("gameover.png");
  image(gameover, 0, 30);
  
  playagainbutton = loadImage ("play-again.png");
  playagainbutton.resize(112, 41);
  
    if (mouseX > 105 && 
      mouseX < 281 && 
      mouseY > 162 &&
      mouseY < 296 ){
  image(playagainbutton, 104, 255);
      }
 
  text(score, 200, 150);
  fill(50);    
  
}

//inputs
void mousePressed(){
  if (mouseX > 82 &&
      mouseX < 193 && 
      mouseY > 194 && 
      mouseY < 232 &&
      gameScreen==0){
      gameSetup();
     startGame();
      }
   if (mouseX > 105 && 
      mouseX < 281 && 
      mouseY > 162 &&
      mouseY < 296 &&
      gameScreen==2){

      gameSetup();
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
     
     green = loadImage("green_platform.png");
     green.resize(45,11);
     
     platforms.add(new Platform(135, 430));
     
     int initPlat = int(random(4,7));
     int sectionSize = height/initPlat;
     
     for(int i=1; i<initPlat; i++){
        platfX = random(0, width);
        platfY = random(sectionSize*i, sectionSize*(i+1));
        platforms.add(new Platform(platfX, platfY));
     }//for i
   }
  
   
   void display(){
     text(score, 20, 20);
     fill(0); 
     
      for(int i=0; i<platforms.size(); i++){
         image (green, platforms.get(i).getX(), platforms.get(i).getY());
         
          if(chara.x < platforms.get(i).getX() + 45 &&
       chara.x + 50 > platforms.get(i).getX() &&
       chara.y + 25 + (50/2) < platforms.get(i).getY() + 11 &&
       chara.y + 50 > platforms.get(i).getY())
       {
           
         if (chara.yVel > 0) {
           chara.yVel -= 30;
         }
       }        
      }
   }
   
   int score;
  
  void platScroll(){
    float flightLeft = height/2 - chara.getY();
    chara.y+=flightLeft;
    for (int i=0; i<platforms.size(); i++){
      platforms.get(i).changeY(platforms.get(i).getY()+flightLeft);
      score += flightLeft;
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

//determine which screen gets set
void startGame(){
  gameScreen = 1;
}