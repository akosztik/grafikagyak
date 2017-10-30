class Lightning
{
  ArrayList<SinWave> waves;
  PVector from, to;
  
  Lightning(Base _from, Base _to)
  {
    from = _from.position;
    to = _to.position;
    
    waves = new ArrayList<SinWave>();
    waves.add(new SinWave(from, to));
    waves.add(new SinWave(from, to));
    waves.add(new SinWave(from, to));
    waves.add(new SinWave(from, to));
    waves.add(new SinWave(from, to));
  }
  
  Lightning(PVector _from, PVector _to)
  {
    from = _from.copy();
    to = _to.copy();
    
    waves = new ArrayList<SinWave>();
    waves.add(new SinWave(_from, _to));
    waves.add(new SinWave(_from, _to));
    waves.add(new SinWave(_from, _to));
    waves.add(new SinWave(_from, _to));
    waves.add(new SinWave(_from, _to));
  }
  
  void Draw()
  {
    for (int i = 0; i < waves.size(); ++i)
    {
      SinWave wave = waves.get(i);
      
      stroke(20, 70, 255 * (1.0 + sin(millis() / (100.0 * i))) / 2.0);
      wave.amplitude = 2.0 * i * sin(millis() / 10.0);
      wave.wave_length = 6.0 * (1.0 + abs(sin(millis() / (i * 100.0))));
      
      wave.Draw();
    }
  }
  
  void SetFrom(PVector _from)
  {
    from = _from.copy();
    for (int i = 0; i < waves.size(); ++i)  
      waves.get(i).SetFrom(_from);
  }
  
  void SetTo(PVector _to)
  {
    to = _to.copy();
    for (int i = 0; i < waves.size(); ++i)  
      waves.get(i).SetTo(_to);
  }
}