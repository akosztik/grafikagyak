float x,y;
PImage ski;
float directionX,directionY;
int rectWidth, rectHight;
float R,G,B;
public void setup() {
  // Size of our sketch will be 800x600, 
  // and use the P2D rendering engine.
  size(800, 449);
  ski=loadImage("ski.jpg");
  setStartingPoints();
  rectWidth=rectHight=20;
  changeColor();
  // We could have used this function instead of size()
  // fullScreen(P2D);
  
  // The background color of our sketch will be black
  // by default, unless specified otherwise
  // background(0);
  
  // We could have used this to set a background image.
  // Note that size of our sketch should be the same as the image.
  // background(loadImage("17142210_1345956188759669_797827030_o.jpg"));
  
  // Shapes and objects will be filled with red by default,
  // unless specified otherwise.
  // fill(255,0,0);
  
  // Shaped and objects will have a white border by default,
  // unless specified otherwise.
  // stroke(255);
}
void draw(){
  background(ski);
  fill(R,G,B); // fill color red
  rect(x, y, rectWidth, rectHight);
  detectCollision();
  move();
}

void setStartingPoints(){
  x=random(width);
  y=random(height);
  directionX=1;
  directionY=1;
}
void move(){
  x += directionX*random(1,5);
  y += directionY*random(1,5);
}
void changeColor(){
  R= random(0,255);
  G= random(0,255);
  B= random(0,255);
}
void detectCollision(){
  if (x+rectWidth >=width){
    directionX=-1;
    changeColor();
  }
  if(y<=0){
    directionY=1;
    changeColor();
  }
  if(y+rectHight>=height){
    directionY=-1;
    changeColor();
  }
  if(x<=0){
    directionX=1;
    changeColor();
  }
}