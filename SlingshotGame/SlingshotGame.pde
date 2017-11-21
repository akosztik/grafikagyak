/********* VARIABLES *********/

// We control which screen is active by settings / updating
// gameScreen variable. We display the correct screen according
// to the value of this variable.
//
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen 
int gameScreen = 0;
//input for moving background:
PImage mountains;
PImage ground;
float xmon=0;
float xground=0;
float groundspeed;
//Slingdhotvars
Slingshot player1;
Slingshot player2;
int slingdistx=200;
int slingdisty=300;
int slingwidth=16;
CatmulRomSpline string1;
CatmulRomSpline string2;

//gamevar:
boolean hasBeenReleased = false;
String winner = "";
String actualplayer;
PVector press;
PVector release; 
PVector dist;
float gravity = 0;
int shotholder=6;
int green=0;
int blue=0;
Circle shot;
Arrow arrow;
Worm worm;



/********* SETUP BLOCK *********/

void setup() {
  size(1000, 600);
  mountains = loadImage("hills.png"); // image is 2000 x 600
  ground = loadImage("ground.png"); // image is 2500 x 200
    //init Slingshot
  dist= new PVector(0,60);
  player1 = new Slingshot(slingdistx,slingdisty);
  player2 = new Slingshot(width-slingdistx-slingwidth,slingdisty);
  string1 = new CatmulRomSpline(new PVector(player1.shotHolderMidle.x-60,player1.shotHolderMidle.y),player1.shotHolderMidle,new PVector(player1.shotHolderMidle.x+60,player1.shotHolderMidle.y));
  string2 = new CatmulRomSpline(new PVector(player2.shotHolderMidle.x-60,player2.shotHolderMidle.y),player2.shotHolderMidle,new PVector(player2.shotHolderMidle.x+60,player2.shotHolderMidle.y));
  actualplayer = "blue";
  worm= new Worm(new PVector(0,0), 6);

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
    delay(5000);
    exit();
  }
}


/********* SCREEN CONTENTS *********/

void initScreen() {

  background(0);
  textAlign(CENTER);
  text("Hit arrow UP to start firing worms....\nWinner is who hits the other's slingshot first.\n 1 shot per turn\n 2players ", width/2, height/2);

}

void gameScreen() {
  if(mousePressed){

      background(64, 160, 255);//http://www.szintan.hu/lista/e/e06.htm
      ground = loadImage("ground.png");
      movingBackground();

      //ellipse(mouseX,mouseY,40,40);
      if (actualplayer == "blue"){
        string1.setControllPoint(new PVector(mouseX, mouseY));
        arrow=new Arrow(mouseX,mouseY,player1.shotHolderMidle);
      }
      if (actualplayer == "green"){
        string2.setControllPoint(new PVector(mouseX, mouseY));
        arrow=new Arrow(mouseX,mouseY,player2.shotHolderMidle);
      }
      worm= new Worm(new PVector(mouseX, mouseY),6);
      worm.Draw();
      arrow.Draw();
      stroke(255,0,0);
      string1.Draw();
      string2.Draw();
      player1.Draw(172, 199, 255);
      player2.Draw(188, 191, 64);

}

if(mousePressed==false){
   background(64, 160, 255);
   movingBackground();
   stroke(255,0,0);
   string1.setControllPoint(player1.shotHolderMidle);
   string1.Draw();
   stroke(255,0,0);
   string2.setControllPoint(player2.shotHolderMidle);
   string2.Draw();
   player1.Draw(172, 199, 255);
   player2.Draw(188, 191, 64);
   
   if (shotholder>0){
     textAlign(CENTER);
     textSize(30);
     fill(255,255,255);
     text("player: "+actualplayer+", g: "+green+", b: "+blue, width/2, height/10);
   }
 }
 
 if(hasBeenReleased){   
    if(actualplayer == "blue" ){
       worm= new Worm(new PVector(0,0), 6);
       worm.Draw(release.x, release.y);
        release.add(press);
        release.y+=gravity;
        gravity+=0.8;
     if (player2.Contains(release.x, release.y)){
       blue++;
     }

   }
   if(actualplayer == "green"  ){
       worm= new Worm(new PVector(0,0), 6);
       worm.Draw(release.x, release.y);
         release.add(press);
         release.y+=gravity;
         gravity+=0.6;
     if( player1.Contains(release.x, release.y)){
       green++;
     }
   }
   if (exitscreen(release.x, release.y)){
     hasBeenReleased=false;
     shotholder--;
    
       if (actualplayer == "green"){
           actualplayer="blue";
       }else{
           actualplayer="green";
       }
   }
 }
 if (groundtouched(worm.x,worm.y)) {
   ground = loadImage("shotground.png");
 }
if(shotholder==0){
    background(0);
   if (green==blue){
     winner="SENKI";
   }else if(green>blue){
     winner="green";
   }else{
     winner="blue";
   }
   gameScreen = 2;
   textSize(50);
   textAlign(CENTER);
   fill(255,255,255);
   text("GAMEOVER\nthe winner is: " + winner, width/2, height/2);
 }
}
void gameOverScreen() {
}


/********* INPUTS *********/


void keyPressed(){
  if (keyCode == UP && gameScreen==0) {
    startGame();
  }
  if (gameScreen==1 && keyCode == RIGHT) {
    xmon += 10;  
   
    //groundspeed= 10*ground.width/mountains.width;
    groundspeed= 10*(ground.width-width)/(mountains.width-width);
  
    xground += groundspeed;
  
  
  } else if(gameScreen==1 && keyCode == LEFT) {
    xmon -= 10; 

    //groundspeed= 10*ground.width/mountains.width;
    groundspeed= 10*(ground.width-width)/(mountains.width-width);
    xground -= groundspeed;
  
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
public void mousePressed() {
  // if we are on the initial screen when clicked, start the game
  if (gameScreen==1) {
    //press = new PVector(mouseX, mouseY);
     if (actualplayer=="blue"){
       press = new PVector(player1.shotHolderMidle.x,player1.shotHolderMidle.y);
    }else{
        press = new PVector(player2.shotHolderMidle.x,player2.shotHolderMidle.y);
    }
  }

}
void mouseReleased(){
  if (gameScreen==1){
  float cSquared;
  if (actualplayer=="blue"){
    cSquared = sqrt(((mouseY-player1.rodHolderleft.endpos.y)*(mouseY-player1.rodHolderleft.endpos.y))+((player1.shotHolderMidle.x-mouseX)*(player1.shotHolderMidle.x-mouseX)))/8;
  }else{
    cSquared = sqrt(((mouseY-player2.rodHolderleft.endpos.y)*(mouseY-player2.rodHolderleft.endpos.y))+((player2.shotHolderMidle.x-mouseX)*(player2.shotHolderMidle.x-mouseX)))/8;
  }
  release = new PVector(mouseX, mouseY);
  press.sub(release);
  press.normalize();
  press.mult(cSquared);
  hasBeenReleased = true;
  gravity = 0;
}
}

boolean exitscreen(float x, float y){
  boolean b= false;
  if (x<0 || x>width || y<0 || y>height){
    b=true;
  
  }
  return b; 
}
boolean groundtouched(float x, float y){
  boolean b= false;
  if (x>0 && x<ground.width && y>height-ground.height && y<height && hasBeenReleased ){
    b=true;
  
  }
  return b; 
}