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


/********* SETUP BLOCK *********/

void setup() {
  size(500, 500);
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
  text("Click to start firing worms....\nWinner is who hits the other's slingshot first.\n 1 shot per turn\n 2players ", height/2, width/2);

}

void gameScreen() {
  background(64, 160, 255);
  
  
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


/********* OTHER FUNCTIONS *********/

// This method sets the necessery variables to start the game  
void startGame() {
  gameScreen=1;
}