// kamera
Camera camera;
ParametricSphere par_sphere = new ParametricSphere();

PShape space_ship_body;
SpaceShip space_ship;
CatmulRomSpline spline;
PVector pos;

ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Asteroid> asteroids= new ArrayList<Asteroid>();


int camera_mode = 1; // 1 -- Free fly, 2 -- spline
int idx = 0;
float t = 0;
int last_time;
float radiusL=10.0;
float radiusM=7.0;
float radiusS=4.0;

void setup()
{
  size( 640, 480, P3D );
  camera = new Camera();
  last_time = millis();
  pos = new PVector(0,0,0);
  space_ship_body = loadShape("space_frigate.obj");
  space_ship = new SpaceShip(space_ship_body);
  space_ship.position = pos;
  space_ship.position.y += 2;
  spline = new CatmulRomSpline();
  spline.AddPoint(PVector.add(pos, new PVector(-3, 3, -3)));
  spline.AddPoint(PVector.add(pos, new PVector(3, 2, -3)));
  spline.AddPoint(PVector.add(pos, new PVector(3, 1.2, 3)));
  spline.AddPoint(PVector.add(pos, new PVector(-3, 2, 3)));
  spline.AddPoint(PVector.add(pos, new PVector(-3, 3, -3)));
  spline.AddPoint(PVector.add(pos, new PVector(3, 2, -3)));
  spline.AddPoint(PVector.add(pos, new PVector(3, 0.2, 3)));
  
  asteroids.add(new Asteroid(radiusL,random(5,45)/100.0,random(5,60)/500.0,(int)random(5,7)));
  asteroids.add(new Asteroid(radiusL,random(5,45)/100.0,random(5,60)/500.0,(int)random(5,7)));
  
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
    camera.lookAt = space_ship.position;
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
  ambient(255, 255, 255);
}

void draw3D()
{  

  space_ship.Draw();
  for (Projectile p : projectiles)
    p.Draw();
    
  translate(40,10,0);
  asteroids.get(1).draw();
  translate(-20,20,0);
  asteroids.get(0).draw();
  
  
  
} // end draw3D()

void breakUp2(){

}

void breakUp3(){
  
}
  