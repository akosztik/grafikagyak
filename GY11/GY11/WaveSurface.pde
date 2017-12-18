class WaveSurface extends ParametricSurface
{
  float size = 6;
  float amplitude = 0.4;
  PVector offset = new PVector();
  
  PVector GetPosition(float u, float v)
  {
    return new PVector(size * u,
      amplitude * sin(u * 2 * PI + offset.x) * cos(v * 2 * PI + offset.y),
      size * v);
  }
  
  PVector GetNormal(float u, float v)
  {
    PVector du = GetDiffU(u, v);
    PVector dv = GetDiffV(u, v);
    PVector n = dv.cross(du);
    
    return n;
  }
  
  PVector GetDiffU(float u, float v)
  {
    PVector vu = new PVector(size,
      amplitude * 2 * PI * cos(2 * PI * u + offset.x) * cos(2 * PI * v + offset.y),
      0);
      
    vu.normalize();
    
    return vu;
  }
  
  PVector GetDiffV(float u, float v)
  {
    PVector vu = new PVector(0,
      -amplitude * 2 * PI * sin(2 * PI * u + offset.x) * sin(2 * PI * v + offset.y),
      size);
    vu.normalize();   
    
    return vu;
  }
}