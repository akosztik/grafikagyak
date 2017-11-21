void setup(){
  size(400,400);
}

void draw(){
  background(255);
  strokeWeight(2);
  stroke(255,0,0);
  drawArrow(100,50,100,100);
  ellipse(50,100, 20, 20);

}

void drawArrow(int cx, int cy, int targetx,int targety ){
  float angle= degrees(atan((cx-targetx)/(cy-targety)));
  int len = 20;
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}