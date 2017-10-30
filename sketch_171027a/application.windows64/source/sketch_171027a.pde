int x1,y1,x2,y2,x3,y3,x4,y4;
PImage ski;
public void setup() {
  // Size of our sketch will be 800x600, 
  // and use the P2D rendering engine.
  size(800, 449);
  ski=loadImage("ski.jpg");
  setStartingPoints();
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
  fill(255,0,0); // fill color red
  stroke(0,0,255); // stroke color blue
  ellipseMode(CENTER); // ref. point to ellipse is its center
  
  ellipse(x1, y1, 20, 20); // draw the ellipse
  fill(255,255,0);
  ellipse(x2, y2, 20, 20); // draw the ellipse
  fill(255,0,255);
  ellipse(x3, y3, 20, 20); // draw the ellipse
  fill(0,0,255);
  ellipse(x4, y4, 20, 20); // draw the ellipse
  
  if (!mousePressed){
  
      // increment x and y
    x1+=1;
    y1+=1;
  
    x2-=2;
    y2+=2;
  
    x3-=3;
    y3-=3;
  
    x4+=4;
    y4-=4;
  
  }
}

void mouseReleased(){
  
 setStartingPoints(); 
  
}
void setStartingPoints(){
  
  x1=0;
  y1=0;
  x2=width;
  y2=0;
  x3=width;
  y3=height;
  x4=0;
  y4=height;
  
}