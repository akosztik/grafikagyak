class Ship{
  int x, y, z;
  int edgeLength;
  float counter;
  float theta, angleX, angleY, rx, ry;
  boolean selected=false;

  Ship(int ix, int iy, int iz, int iedgeLength){
    x = ix;
    y = iy;
    z = iz;
    edgeLength = iedgeLength;
  }

  void makeShape(){
    translate(x, y);
    
    beginShape(TRIANGLE_STRIP);
    vertex(edgeLength, edgeLength, edgeLength);
    vertex(-edgeLength, -edgeLength, edgeLength);
    vertex(-edgeLength, edgeLength, -edgeLength);
    vertex(edgeLength, -edgeLength, -edgeLength);
    vertex(edgeLength, edgeLength, edgeLength);
    vertex(-edgeLength, -edgeLength, edgeLength);
    endShape(CLOSE);
  }
}