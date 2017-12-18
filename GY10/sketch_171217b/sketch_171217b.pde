int num = 18;
int edgeLength = 5;

Ship ship;

void setup(){
  size(200,200, P3D);
  ship = new Ship(8, 8, 6, edgeLength);

}

void draw(){
  background(0);
  directionalLight(0, 0, 255, 0, 0, -1);
  pushMatrix();
    ship.makeShape();
  popMatrix();
    
  
}