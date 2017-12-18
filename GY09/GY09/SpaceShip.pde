class SpaceShip
{
  PVector position = new PVector(0, 0, 0);
  int last_time;
    
  SpaceShip()
  {
    last_time = millis();
  }
  
  void RotateLeft(Boolean on)
  {
  }
  
  void RotateRight(Boolean on)
  {
  }
  
  void MoveForward(Boolean on)
  {
  }
  
  void MoveBackward(Boolean on)
  {
  }
  
  PVector GetForward()
  {
    return new PVector();
  }
  
  void Fire()
  {
  }
  
  void update()
  {
    float delta_time = (millis() - last_time) / 1000.0;
    last_time = millis();
  }
  
  void draw()
  {    
      beginShape(TRIANGLES);
        vertex(0, -0.5, 0);
        vertex(0, 0.5, 0);
        vertex(-0.75, 0, 0);
        
        vertex(0, -0.5, 0);
        vertex(0, 0.5, 0);
        vertex(0.75, 0, 0);
        
        vertex(0, -0.5, 0);
        vertex(0, 0, 1.5);
        vertex(0.75, 0, 0);
        
        vertex(0, 0.5, 0);
        vertex(0, 0, 1.5);
        vertex(0.75, 0, 0);
        
        vertex(0, -0.5, 0);
        vertex(0, 0, 1.5);
        vertex(-0.75, 0, 0);
        
        vertex(0, 0.5, 0);
        vertex(0, 0, 1.5);
        vertex(-0.75, 0, 0);
      endShape();
  }
}
