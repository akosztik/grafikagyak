import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_171027a extends PApplet {

int x1,y1,x2,y2,x3,y3,x4,y4;
PImage ski;
public void setup() {
  // Size of our sketch will be 800x600, 
  // and use the P2D rendering engine.
  
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
public void draw(){
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

public void mouseReleased(){
  
 setStartingPoints(); 
  
}
public void setStartingPoints(){
  
  x1=0;
  y1=0;
  x2=width;
  y2=0;
  x3=width;
  y3=height;
  x4=0;
  y4=height;
  
}
  public void settings() {  size(800, 449); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_171027a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
