class SinWave
{
  PVector from; 
  PVector to;
  float amplitude = 10;
  float wave_length = 10;
  int detailness = 10;
  ArrayList<SinWave> neighbours;
  
  SinWave(PVector _from, PVector _to)
  {
    from = _from;
    to = _to;
  }

  void AddNeighbour(SinWave n)
  {  
    if (neighbours == null)
      neighbours = new ArrayList<SinWave>();
    neighbours.add(n);
  }
  
  void SetFrom(PVector _from)
  {
    from = _from.get();
  }
  
  void SetTo(PVector _to)
  {
    to = _to.get();
  }
  
  void Draw()
  {
    PVector diff = to.get().sub(from);
    float distance = diff.mag();
    
    pushMatrix();
      translate(from.x, from.y);
      float angle = atan2(diff.y, diff.x);
      rotate(angle);
    
      beginShape(LINES);
        int outer_step = (int)(distance / (wave_length * 2.0 * PI));
        
        for (int j = 0; j < outer_step; ++j)
        {
          float offset = j * (wave_length * 2.0 * PI);
          
          float step = 2.0 * PI / detailness;
          for (int i = 0; i < detailness; ++i)
          {
            float x1 = offset + i * step * wave_length;
            float y1 = amplitude * sin(i * step);
            float x2 = offset + (i + 1) * step * wave_length;
            float y2 = amplitude * sin((i + 1) * step);
            
            vertex(x1, y1);
            vertex(x2, y2);
          }
        }
      endShape();
    popMatrix();
  }
}