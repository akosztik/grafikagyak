class SinWave extends Shape
{
  PVector from = new PVector(0,0), to = new PVector(100, 100);
  float amplitude = 10;
  float wave_length = 10;
  
  SinWave()
  {
  }
  
  void Draw()
  {
    beginShape();
    
    float step = 2 * PI / detailness;
    for (int i = 0; i < detailness; ++i)
    {
      float x = i * step;
      float y = sin(x);
      
      vertex(wave_length * x, amplitude * y);
    }    
    
    endShape();
  }
  
  Boolean Contains(float x, float y)
  {
    return false;
  }
}