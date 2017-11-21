PImage mountains;
PImage ground;
int xmon=0;
int xground=0;
int groundspeed;
void setup()
  {
    size(400,600);  
    mountains = loadImage("Mountains.png"); // image is 2000 x 600
    ground = loadImage("ground.png"); // image is 2500 x 200
  }
void draw()
{
  background(64, 160, 255); 
  xmon = constrain(xmon, 0, mountains.width - width); 
  xground = constrain(xground, 0, ground.width - width); 
  
  set(-xmon, 0, mountains);
  set(-xground, height*2/3, ground);
  
  stroke(0,0,0);
  ellipse(mouseX,mouseY,15,15);
}
void keyPressed(){
  if (keyCode == RIGHT) {
    xmon += 10;  
    groundspeed= 10*ground.width/mountains.width;
    xground += groundspeed;
  
  } else if(keyCode == LEFT) {
    xmon -= 10; 
    groundspeed= 10*ground.width/mountains.width;
    xground -= groundspeed;
  }
}