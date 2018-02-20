import java.util.Iterator;
// kamera
Camera camera;

SpaceShip space_ship;
PVector pos;

ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Asteroid> asteroids= new ArrayList<Asteroid>();
ArrayList<ParametricSphere> asteroid= new ArrayList<ParametricSphere>();


int camera_mode = 1; // 1 -- Free fly, 2 -- spline
int idx = 0;
float t = 0;
int last_time;
int mouseEventValue = 0;
float radiusL=10.0;
float radiusM=7.0;
float radiusS=4.0;

void setup()
{
  size( 640, 480, P3D );
  camera = new Camera();
  last_time = millis();
  pos = new PVector(0,0,0);
  space_ship = new SpaceShip();
  space_ship.position = pos;
  space_ship.position.y += 2;
  int[] randomTenyezo = new int[10];
  for( int i = 0; i < randomTenyezo.length; i++ )
  {
    randomTenyezo[i] = (int)(Math.random()*10)+1;
  }
  
  //asteroids.add(new Asteroid(radiusL,random(5,45)/100.0,random(5,60)/500.0,(int)random(5,7)));
  //asteroids.add(new Asteroid(radiusL,random(5,45)/100.0,random(5,60)/500.0,(int)random(5,7)));
  asteroid.add(new ParametricSphere((int)radiusL,(int)random(5,7),randomTenyezo[0]));
  asteroid.add(new ParametricSphere((int)radiusL,(int)random(5,7),randomTenyezo[1]));
}

void update()
{     
  float  delta_time = (millis() - last_time) / 1000.0;
  last_time = millis();
    
   if (camera_mode == 1) {   
    camera.resetCamera();
    last_time = millis();
    camera_mode = 5;
  } else if (camera_mode == 2) {
    camera.eye = new PVector(space_ship.position.x+70,space_ship.position.y+70,space_ship.position.z+70);
    camera.lookAt = new PVector(space_ship.position.x,space_ship.position.y,space_ship.position.z);
    camera.applyCamera();
  } else if (camera_mode == 3) {
    camera.eye = new PVector(20,20,space_ship.position.z+20);
    camera.lookAt = new PVector(space_ship.position.x,space_ship.position.y,space_ship.position.z);
    camera.applyCamera();
  }
  
  space_ship.Update();
  for (Projectile p : projectiles)
    p.Update();
  Iterator<Projectile> it = projectiles.iterator();
  while (it.hasNext()) {
    Projectile p = it.next();
    if(dist(p.start.x, p.start.y, p.start.z, p.position.x, p.position.y, p.position.z) >= 300){
        it.remove();
    }
  }
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
        camera.MoveForward();
        break;
      case 'a':
        camera.MoveLeft();
        break;
      case 's':
        camera.MoveBackward();
        break;
      case 'd':
        camera.MoveRight();
        break;
      case '1':
        camera_mode = 1;
        break;
      case '2':
        camera_mode = 2;
        break;
      case '3':
        camera_mode = 3;
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
        camera.MoveForward();
        break;
      case 'a':
        camera.MoveLeft();
        break;
      case 's':
        camera.MoveBackward();
        break;
      case 'd':
        camera.MoveRight();
        break;
    }
  }
}
void mousePressed() {
  if (mouseEventValue == 0 && (mouseButton == RIGHT)) {
     space_ship.MoveForward(true);
      mouseEventValue = 255;
  } else {
    mouseEventValue = 0;
  }
}

void mouseReleased() {
  if (mouseEventValue == 255) {
     space_ship.MoveForward(false);
     mouseEventValue = 0;
  } else {
    mouseEventValue = 0;
  }
}
void setLight()
{
  lights();
  ambient(255, 255, 255);
}

void draw3D()
{  

  space_ship.Draw();
  for (Projectile p : projectiles)
    p.Draw();
    
  
    translate(-20,20,0);
    //asteroids.get(0).draw();
    asteroid.get(0).Draw();
    translate(20,10,0);
    asteroid.get(1).Draw();
  
 /* pushMatrix();
    translate(20,10,0);
    //asteroids.get(1).draw();
    asteroid.get(1).Draw();
  popMatrix();*/
  
  
} // end draw3D()

void breakUp2(){

}

void breakUp3(){
  
}
  