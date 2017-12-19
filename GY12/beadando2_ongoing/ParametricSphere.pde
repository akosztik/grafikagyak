class ParametricSphere extends ParametricSurface
{
  float r;
 
  ParametricSphere() {
    r = 2;
  }
  
  PVector GetNormal(float u, float v)
  {
    PVector pos = GetPosition(u, v);
    pos.normalize();
    
    return pos;
  }
  
  PVector GetDiffU(float u, float v)
  {
    return new PVector();
  }
  
  PVector GetDiffV(float u, float v)
  {
    return new PVector();
  }
 
  PVector GetPosition(float u, float v)
  {
    u *= 2*3.14159265;
    v *= 3.14159265;
  
    return new PVector(
      r * sin(v) * cos(u),
      r * cos(v)         ,
      r * sin(v) * sin(u)
    );
  }
}