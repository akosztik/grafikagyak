// kamera
Camera camera;

void setup()
{
  size( 640, 480, P3D );
  camera = new Camera();
}

void update()
{     
  camera.update(); 
}

void draw()
{
  background(140);
 
  update();
 
  setLight();

  draw3D();
}

void keyPressed()
{
  switch (key)
  {
    case 'w':
      camera.MoveForward(true);
      break;
    case 'a':
      camera.MoveLeft(true);
      break;
    case 's':
      camera.MoveBackward(true);
      break;
    case 'd':
      camera.MoveRight(true);
      break;
  }
}

void keyReleased()
{
  switch (key)
  {
    case 'w':
      camera.MoveForward(false);
      break;
    case 'a':
      camera.MoveLeft(false);
      break;
    case 's':
      camera.MoveBackward(false);
      break;
    case 'd':
      camera.MoveRight(false);
      break;
  }
}

void setLight()
{
  lights();
  directionalLight(51, 102, 126, -1, -1, 0);
}

void draw3D()
{  
  pushMatrix();
    rotateY(millis() / 1000.0);
    
    pushMatrix();
      drawPyramid();
      rotateX(PI);
      drawPyramid();
    popMatrix();
    
    pushMatrix();
      translate(0,2,0);
      drawPyramid();
      rotateX(PI);
      drawPyramid();
    popMatrix();
    
    pushMatrix();
      rotateY(-millis() / 500.0);
      translate(0,1,0);
      rotateX(PI / 2);
      translate(0,1,0);
      rotateY(millis() / 500.0);
      scale(0.5, 1, 0.5);
      drawPyramid();
      rotateX(PI);
      drawPyramid();
    popMatrix();
  popMatrix();
  
} // end draw3D()

void drawPyramid()
{
    beginShape(TRIANGLES);
      vertex(1,0,1);
      vertex(-1,0,1);
      vertex(-1,0,-1);
      
      vertex(1,0,1);
      vertex(-1,0,-1);
      vertex(1,0,-1);
      
      vertex(1,0,1);
      vertex(-1,0,1);
      vertex(0,1,0);
      
      vertex(1,0,1);
      vertex(1,0,-1);
      vertex(0,1,0);
      
      vertex(-1,0,-1);
      vertex(-1,0,1);
      vertex(0,1,0);
      
      vertex(-1,0,-1);
      vertex(1,0,-1);
      vertex(0,1,0);
    endShape();
}