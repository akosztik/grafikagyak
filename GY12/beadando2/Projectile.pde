class Projectile
{
  PVector start;
  PVector position;
  PVector velocity;
  float speed = 8;
  int last_time;
  float angle;
  
  ParametricCylinder body;
  
  Projectile(PVector _position, PVector _direction)
  {
    start=_position.get();
    body = new ParametricCylinder();
    position = _position.get();
    velocity = _direction.get();
    velocity.normalize();
    velocity.mult(speed);
    last_time = millis();
    
    angle = atan2(_direction.x, _direction.z);
  }
  
  void Update()
  {
    float  delta_time = (millis() - last_time) / 1000.0;
    last_time = millis();
    
    PVector v = velocity.get();
    v.mult(delta_time);
    position.add(v);
  }
  
  void Draw()
  {
    fill(255);
    pushMatrix();
      translate(position.x, position.y, position.z);
      rotateY(angle);
      rotateX(PI / 2);
      scale(0.05);
      body.Draw();
    popMatrix();
  }
}