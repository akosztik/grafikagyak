/********* VARIABLES *********/

// We control which screen is active by settings / updating
// gameScreen variable. We display the correct screen according
// to the value of this variable.
//
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen
int playerIndex = 0; 
int gameScreen = 0;
//input for moving background:
PImage mountains;
PImage ground;
float xmon=0;
float xground=0;
float groundspeed;


/********* SETUP BLOCK *********/

void setup() {
  size(800, 600);
  mountains = loadImage("Mountains.png"); // image is 2000 x 600
  ground = loadImage("ground.png"); // image is 2500 x 200
}


/********* DRAW BLOCK *********/

void draw() {
  // Display the contents of the current screen
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    gameOverScreen();
  }
}


/********* SCREEN CONTENTS *********/

void initScreen() {

  background(0);
  textAlign(CENTER);
  text("Click to start firing worms....\nWinner is who hits the other's slingshot first.\n 1 shot per turn\n 2players ", width/2, height/2);

}

void gameScreen() {
  background(64, 160, 255);
  movingBackground();
    
  stroke(0,0,0);
  ellipse(mouseX,mouseY,15,15);
  
}
void gameOverScreen() {
  // codes for game over screen
}


/********* INPUTS *********/

public void mousePressed() {
  // if we are on the initial screen when clicked, start the game
  if (gameScreen==0) {
    startGame();
  }
}
void keyPressed(){
  if (keyCode == RIGHT) {
    xmon += 10;  
    //println("----------"+xmon);
    //groundspeed= 10*ground.width/mountains.width;
    groundspeed= 10*(ground.width-width)/(mountains.width-width);
    //println(groundspeed);
    xground += groundspeed;
    //println("+++++++"+xground);
  
  } else if(keyCode == LEFT) {
    xmon -= 10; 
    //println("----------"+xmon);
    //groundspeed= 10*ground.width/mountains.width;
    groundspeed= 10*(ground.width-width)/(mountains.width-width);
    xground -= groundspeed;
    //println("+++++++"+xground);
  }
}


/********* OTHER FUNCTIONS *********/

// This method sets the necessery variables to start the game  
void startGame() {
  gameScreen=1;
}
void movingBackground(){
  xmon = constrain(xmon, 0, mountains.width - width); 
  xground = constrain(xground, 0, ground.width - width); 
  
  set(round(-xmon), 0, mountains);
  set(round(-xground), height*2/3, ground);
  
}