class ParametricCylinder extends ParametricSurface
{
  float height = 3;
  float radius = 1;
  
  PVector GetPosition(float u, float v)
  {
    u *= 2 * PI;
    return new PVector(radius * cos(u),
      v * height,
      radius * sin(u));
  }
  
  PVector GetNormal(float u, float v)
  {
    PVector n = GetPosition(u, v);
    n.y = 0;
    n.normalize();
    return n;
  }
  
  PVector GetDiffU(float u, float v)
  {
    return new PVector();
  }
  
  PVector GetDiffV(float u, float v)
  {
    return new PVector();
  }
}