// kamera
PVector eye, lookAt, up;

void setup()
{
  size( 640, 480, P3D );
}

void update()
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
  directionalLight(51, 102, 126, -1, -1, 0);
}

void draw3D()
{  

} // end draw3D()