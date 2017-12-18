// kamera
Camera camera;
ParametricSphere par_sphere = new ParametricSphere(2);

SpaceShip space_ship;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
CatmulRomSpline spline;

int camera_mode = 1; // 1 -- Free fly, 2 -- spline
int idx = 0;
float t = 0;
int last_time;

void setup()
{
  size( 640, 480, P3D );
  camera = new Camera();
  last_time = millis();
  
  space_ship = new SpaceShip();
  PVector pos= new PVector(0,0,0);
  space_ship.position = pos;
  space_ship.position.y += 2;
}
void update()
{     
  float  delta_time = (millis() - last_time) / 1000.0;
  last_time = millis();
    
  if (camera_mode == 1)   
    camera.update(); 
  else if (camera_mode == 2)
  {
    t += 0.4 * delta_time;
    if (t >= 1.0)
    {
      t = 0;
      ++idx;
      if (idx >= spline.controllPoints.size() - 3)
        idx = 0; 
    }
    
    camera.eye = spline.eval(t, idx);
    camera.lookAt =new PVector(0,0,0);
    camera.applyCamera();
  }
  
  space_ship.Update();
  for (Projectile p : projectiles)
    p.Update();
  
}

void draw()
{
  background(0);
 
  update();
 
  setLight();

  draw3D();
}

void keyPressed()
{
  if (key == CODED) {
    switch (keyCode)
    {
      case LEFT:
        space_ship.TurnLeft(true);
        break;
      case RIGHT:
        space_ship.TurnRight(true);
        break;
      case UP:
        space_ship.MoveForward(true);
        break;
      case DOWN:
        space_ship.MoveBackward(true);
        break;
    }
  } else
  {
    switch (key)
    {
      case ' ':
        space_ship.Fire(projectiles);
        break;
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
      case '1':
        camera_mode = 1;
        break;
      case '2':
        camera_mode = 2;
        break;
    }
  }
}

void keyReleased()
{
  if (key == CODED) 
  {
    switch (keyCode)
    {
      case LEFT:
        space_ship.TurnLeft(false);
        break;
      case RIGHT:
        space_ship.TurnRight(false);
        break;
      case UP:
        space_ship.MoveForward(false);
        break;
      case DOWN:
        space_ship.MoveBackward(false);
        break;
    }
  } else
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
}

void setLight()
{
  lights();
  directionalLight(51, 102, 126, -1, -1, 0);
  ambient(150, 150, 150);
  
}

void draw3D()
{  
  pushMatrix();
    translate(0, 0, 0);
    par_sphere.Draw();
  popMatrix();

  space_ship.Draw();
  lights();
  
    
  for (Projectile p : projectiles)
     p.Draw();
  

  
} // end draw3D()