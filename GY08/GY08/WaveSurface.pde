class WaveSurface extends ParametricSurface
{
  float size = 6;
  PVector offset = new PVector();
  
  PVector GetPosition(float u, float v)
  {
    return new PVector(size * u,
      sin(u * 2 * PI + offset.x) * cos(v * 2 * PI + offset.y),
      size * v);
  }
  
  PVector GetNormal(float u, float v)
  {
    return new PVector(0,0,0);
  }
}