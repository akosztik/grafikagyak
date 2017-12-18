class SpaceShip
{
  PShape body;
  PVector position = new PVector();
  PVector rotation = new PVector();
  float scale_factor = 0.05;
  Boolean is_move_forward = false, is_move_backward = false;
  Boolean is_turn_left = false, is_turn_right = false;
  int last_time;
  
  float speed = 0;
  float angular_speed = 2;
  
  SpaceShip(PShape _body)
  {
    body = _body;
    last_time = millis();
  }
  
  void Update()
  {
    float delta_time = (millis() - last_time) / 1000.0;
    last_time = millis();
    
    // Rotate
    if (is_turn_left)
    {
      rotation.y -= angular_speed * delta_time;
    }
    
    if (is_turn_right)
    {
      rotation.y += angular_speed * delta_time;
    }
    
    // Move
  }
  
  PVector GetForward()
  {
    return new PVector(cos(PI - rotation.y), 0, sin(PI - rotation.y));
  }
  
  void Draw()
  {
    pushMatrix();
      translate(position.x, position.y, position.z);
      rotateX(rotation.x);
      rotateY(rotation.y);
      rotateZ(rotation.z);
      scale(scale_factor);
      shape(body);
    popMatrix();
  }
   
  void TurnLeft(Boolean on)
  {
    is_turn_left = on;
  }
  
  void TurnRight(Boolean on)
  {
    is_turn_right = on;
  }
  
  void MoveForward(Boolean on)
  {
    is_move_forward = on;
  }
  
  void MoveBackward(Boolean on)
  {
    is_move_backward = on;
  }
}