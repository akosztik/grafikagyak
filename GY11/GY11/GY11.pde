// kamera
Camera camera;
ParametricCylinder par_cylinder = new ParametricCylinder();
ParametricSphere par_sphere = new ParametricSphere();
WaveSurface wave = new WaveSurface();

PImage tex_water, tex_earth, tex_chicken;
ParametricSphere sky_box = new ParametricSphere();

PShape space_ship_body;
SpaceShip space_ship;

ArrayList<Projectile> projectiles = new ArrayList<Projectile>();

PShape boat;

void setup()
{
  size( 640, 480, P3D );
  camera = new Camera();
  
  tex_water = loadImage("texture.bmp");
  tex_earth = loadImage("earth.jpg");
  tex_chicken = loadImage("csirke.jpg");
  
  wave.tex = tex_water;
  par_sphere.tex = tex_earth;
  par_cylinder.tex = tex_chicken;
  
  space_ship_body = loadShape("space_frigate.obj");
  space_ship = new SpaceShip(space_ship_body);
  space_ship.position = wave.GetPosition(0.5, 0.5);
  space_ship.position.y += 2;
  
  boat = loadShape("OldBoat.obj");
  
  sky_box.tex = loadImage("skybox.png");
}

void update()
{     
  camera.update(); 
  space_ship.Update();
  for (Projectile p : projectiles)
    p.Update();
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
    wave.tex_offset.x = millis() / 10000.0f;
    wave.tex_offset.y = millis() / 10000.0f;
    wave.offset.x = millis() / 500.0f;
    wave.offset.y = millis() / 500.0f;
    
    PVector pos = wave.GetPosition(0.5, 0.5);
    PVector normal = wave.GetNormal(0.5, 0.5);
    PVector du = wave.GetDiffU(0.5, 0.5);
    PVector dv = wave.GetDiffV(0.5, 0.5);
        
    stroke(255,0,0);
    line(pos.x, pos.y, pos.z, pos.x + normal.x, pos.y + normal.y, pos.z + normal.z);
    stroke(0,255,0);
    line(pos.x, pos.y, pos.z, du.x + pos.x, du.y + pos.y, du.z + pos.z);
    stroke(0,0,255);
    line(pos.x, pos.y, pos.z, dv.x + pos.x, dv.y + pos.y, dv.z + pos.z);
    wave.Draw();
  popMatrix();
    
  space_ship.Draw();
  
  noLights();
  pushMatrix();
    translate(camera.eye.x, camera.eye.y, camera.eye.z);
    scale(10);
    sky_box.Draw();
  popMatrix();
  lights();
  
  pushMatrix();
    translate(pos.x, pos.y + 0.05, pos.z);
    applyMatrix(du.x, normal.x, dv.x, 0,
      du.y, normal.y, dv.y, 0,
      du.z, normal.z, dv.z, 0,
      0, 0, 0, 1);
    scale(0.05);
    shape(boat);
  popMatrix();
    
  for (Projectile p : projectiles)
    p.Draw();
  
  
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