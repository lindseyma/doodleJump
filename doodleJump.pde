//variables for diff screens
// 0: initial
// 1: gameplay
// 2: game-over
// 3: instructions

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
  if(monsters.size()>0){
    for(int i=0; i<monsters.size(); i++){
      monsters.remove(i);
    }
  }
  
  for(int j=0; j<platforms.size(); j++){
    platforms.remove(j);
  }
}

//draw
void draw(){
   if (gameScreen == 0) {
    initScreen();
  } 
  if (gameScreen == 1) {
    gameScreen();
  } 
  if (gameScreen == 2) {
    gameOverScreen();
  }
  
  if (gameScreen == 3) {
    instructionScreen();
  }
}

//screen contents
PImage bg;
PImage playbutton;
PImage playonbutton;

void initScreen() {
  //initial screen
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
  //gameplay screen
  bg = loadImage ("background.png");
  bg.resize(320, 480);
  background(bg);
  display();//disp plats
  displayM();//disp mons
   
   if(chara.y <= height/2){
     platScroll();
   }
   
  chara.display();
  //chara.gravity();
  chara.movement();

  cleanUp();
   
   monsterGen();
   
   if (chara.y > 480){
     fall();
  
     gameScreen = 2;
   }
}

void fall(){
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

void instructionScreen(){
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

//platform stuff/////////////////////////////////////////

ArrayList<Platform> platforms= new ArrayList<Platform>();

PImage green;

float platfX;
float platfY;
    
   void initPlatSetup(){
     
     green = loadImage("green_platform.png");
     green.resize(45,11);
     
     platforms.add(new Platform(135, 430));
     
     int initPlat = int(random(5,7));
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
      
     /*for(int i=0; i<platforms.size(); i++){
       if(*/
       
     for(int i=0; i<monsters.size(); i++){
       if(chara.x < monsters.get(i).getX() + 30 &&
       chara.x + 50 > monsters.get(i).getX() &&
          chara.y + 25 + (50/2) < monsters.get(i).getY() + 30 &&
          chara.y + 50 > monsters.get(i).getY()){
            gameScreen = 2;
          }
     }
   }//display
   
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
    if(monsters.size()>0){
    for (int i=0; i<monsters.size(); i++){
      monsters.get(i).setY(monsters.get(i).getY()+flightLeft);
      if(monsters.get(i).getY()>height){
        monsters.remove(i);
        i--;
      }
    }//for platform scroll -> works diff from plat because of the generation method
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
    int whatPlat = (int)random(0,300);
    if (whatPlat == 28){
      platforms.add(new vPlat((float)(random(0, width - 35)), -1));
    }
    if(whatPlat == 10){
      platforms.add(new hPlat((float)(random(0, width - 35)), -1));
    }
    else{
    platforms.add(new Platform((float)(random(0, width - 35)), -1));
    }
  }
   
  //monster stuff /////////////////////////////////////////////////////
  
  //array of current monsters on screen
  ArrayList<Monster> monsters= new ArrayList<Monster>();
  
  boolean monster;
  
  //method for monsters appearing
  void monsterGen(){
   if( (int)(random(0,300)) == 28){
     monster = true;
   }//if to decide monster boolean
   if(monster){
     monsters.add(new Monster((float)(random(0, width - 35)), -1));
   }//generating of monster
   monster=false;
  }
  
  void displayM(){
    for(int i=0; i<monsters.size(); i++){
      rect(monsters.get(i).getX(), monsters.get(i).getY(), 30, 30);
    }
  }

//determine which screen gets set
void startGame(){
  gameScreen = 1;
}