// kamera
Camera camera;
ParametricCylinder par_cylinder = new ParametricCylinder();
ParametricSphere par_sphere = new ParametricSphere();
WaveSurface wave = new WaveSurface();

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
    translate(4, 0, -2);
    par_cylinder.Draw();
  popMatrix();
  
  pushMatrix();
    translate(0, 4, 0);
    par_sphere.Draw();
  popMatrix();
  
  pushMatrix();
    wave.offset.x = millis() / 500.0f;
    wave.offset.y = millis() / 500.0f;
    wave.Draw();
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