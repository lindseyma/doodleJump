//variables for diff screens
// 0: initial
// 1: gameplay
// 2: game-over

int gameScreen = 0;
Doodle chara;

//setup
void setup(){
  size(320, 480);
  chara = new Doodle(135, 30);
  platforms = new Platform(
  frameRate(30);
}

//draw

void draw(){
   if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
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
  chara.gravity();
  chara.movement();
  
  
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
  
  if (key == 'w'){
    chara.up = -1;
  }
}

void keyReleased(){
  if (key == 'a'){
    chara.left = 0;
  }
  
  if (key == 'd'){
    chara.right = 0;
  }
  
  if (key == 'w'){
    chara.up = 0;
  }
}


//determine which screen gets set
void startGame(){
  gameScreen = 1;
}