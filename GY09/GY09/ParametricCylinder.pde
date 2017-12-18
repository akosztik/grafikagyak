class ParametricCylinder extends ParametricSurface
{
  float h;
  float r;
 
  ParametricCylinder() {
    h = 2;
    r = 0.6;
  }
  
  PVector GetNormal(float u, float v)
  {
    PVector pos = GetPosition(u, v);
    pos.y = 0;
    pos.normalize();
    return pos;
  }
 
  PVector GetPosition(float u, float v)
  {
    return new PVector(
      cos(v*2*3.141592654)*r,
      u*h,
      sin(v*2*3.141592654)*r);
  }
}
