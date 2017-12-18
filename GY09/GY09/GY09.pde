// parametrikus felületek
ParametricCylinder hengerpalast;
ParametricSphere gomb;
WaveSurface hullamzoSik;

// kamera
Camera camera;
Boolean fixedCamera = false;

SpaceShip spaceship;
PImage tex_water, tex_csirke, tex_earth;

void setup()
{
  size( 640, 480, P3D );
  
  camera = new Camera();
    
  spaceship = new SpaceShip();
    
  // Lekodolt tartalom
  hengerpalast = new ParametricCylinder();
  gomb = new ParametricSphere();
  hullamzoSik = new WaveSurface(0.2);
        
  tex_water = loadImage("texture.bmp");
  tex_csirke = loadImage("csirke.jpg");
  tex_earth = loadImage("earth.jpg");
  
  hullamzoSik.setTexture(tex_water);
  hengerpalast.setTexture(tex_csirke);
  gomb.setTexture(tex_earth);
        
}

void update()
{      
  spaceship.update();
  camera.update();
  hullamzoSik.offset.x = millis() / 500.0;
  hullamzoSik.offset.y = millis() / 500.0;
}

void keyPressed()
{
}

void keyReleased()
{
}

void draw()
{
  background(140);
 
  update();
 
  setLight();

  draw3D();
}

void setLight()
{
  lights();
}

void draw3D()
{
  // Gömb!
  pushMatrix();
    scale(0.2,0.2,0.2);
    gomb.draw();
  popMatrix();
 
  // Henger!
  pushMatrix();
    translate(-2, 0, 0);
    hengerpalast.draw();
  popMatrix();
  
  float unitDistance = millis() / 1000.0 * 3.1415965/4;
  
  PVector pos1 = hullamzoSik.GetPosition(0.5, 0.5);
  PVector normal = hullamzoSik.GetNormal(0.5, 0.5);
  PVector du = hullamzoSik.GetDiffU(0.5, 0.5);
  PVector dv = hullamzoSik.GetDiffV(0.5, 0.5);
  
  // Hullámok!  
  pushMatrix();
    translate(-2, 0, 2);
    scale(3,1,3);
    hullamzoSik.draw();
    
    stroke(0,255,0);
    line(pos1.x, pos1.y, pos1.z, pos1.x + 0.2 * normal.x, pos1.y + 0.2 * normal.y, pos1.z + 0.2 * normal.z);
    stroke(255,0,0);
    line(pos1.x, pos1.y, pos1.z, pos1.x + 0.2 * du.x, pos1.y + 0.2 * du.y, pos1.z + 0.2 * du.z);
    stroke(0,0,255);
    line(pos1.x, pos1.y, pos1.z, pos1.x + 0.2 * dv.x, pos1.y + 0.2 * dv.y, pos1.z + 0.2 * dv.z);
    noStroke();
  popMatrix();  
  
  spaceship.draw();
   
  
} // end draw3D()



