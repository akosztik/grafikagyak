class WaveSurface extends ParametricSurface
{
  float amplitude = 1.0;
  PVector offset = new PVector();
  
  WaveSurface(float _amplidute)
  {
    amplitude = _amplidute;
  }
  
  PVector GetNormal(float u, float v)
  {
    PVector du = GetDiffU(u, v);
    PVector dv = GetDiffV(u, v);
    PVector n = du.cross(dv);
    
    return n;
  }
  
  PVector GetDiffU(float u, float v)
  {
    PVector vu = new PVector(1,
      2 * PI * amplitude * cos(2 * PI * u + offset.x) * cos(2 * PI * v + offset.y),
      0);
      
    vu.normalize();
    
    return vu;
  }
  
  PVector GetDiffV(float u, float v)
  {
    PVector vu = new PVector(0,
      -2 * PI * amplitude * sin(2 * PI * u + offset.x) * sin(2 * PI * v + offset.y),
      1);
    vu.normalize();   
    
    return vu;
  }
  
  PVector GetPosition(float u, float v)
  {  
    return new PVector(u,
      amplitude * sin(2 * PI * u + offset.x) * cos(2 * PI * v + offset.y),
      v);
  }
}
