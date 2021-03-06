class SpaceShip
{
  PVector position = new PVector();
  PVector rotation = new PVector();
  float scale_factor = 5;
  Boolean is_move_forward = false;
  Boolean is_move_backward = false;
  Boolean is_turn_left = false, is_turn_right = false, is_turn_up = false, is_turn_down = false;
  int last_time;
  
  
  
  float acc = 10;
  float angular_acc = 2.0;
  float max_speed = 10;
  float max_angular_speed = 2;
  float speed = 0;
  float angular_speed = 0;
  
  SpaceShip()
  {
    last_time = millis();
  }
  
  void Update()
  {
    float delta_time = (millis() - last_time) / 1000.0;
    last_time = millis();
    
    // Rotate
    if (is_turn_left)
      angular_speed = max(-max_angular_speed, angular_speed - angular_acc * delta_time);
    
    if (is_turn_right)
      angular_speed = min(max_angular_speed, angular_speed + angular_acc * delta_time);
      
    if (!is_turn_left && !is_turn_right &&!is_turn_up && !is_turn_down)
    {
      int sgn = angular_speed < 0 ? -1 : 1;
      angular_speed = angular_speed - 0.5 * sgn * delta_time * angular_acc;
      if (abs(angular_speed) < 0.5 * delta_time * angular_acc)
        angular_speed = 0;
    }
      
    if (abs(angular_speed) > 0)
      rotation.y += angular_speed * delta_time;
      
    // Move
    if (is_move_backward)
      speed = max(-max_speed, speed - acc * delta_time);
    
    if (is_move_forward)
      speed = min(max_speed, speed + acc * delta_time);
      
    if (!is_move_backward && !is_move_forward)
    {
      int sgn = speed < 0 ? -1 : 1;
      speed = speed - 0.5 * sgn * delta_time * acc;
      if (abs(speed) < 0.5 * delta_time * acc)
        speed = 0;
    }
      
    if (abs(speed) > 0)
    {
      PVector f = GetForward();
      f.mult(speed * delta_time);
      position.add(f);
    }
  }
  
  void Fire(ArrayList<Projectile> projectiles)
  {
    Projectile p = new Projectile(position, GetForward());
    projectiles.add(p);
  }
  
  PVector GetForward()
  {
    return new PVector(cos(PI - rotation.y), 0, sin(PI - rotation.y));
  }
  
  void Draw()
  {
    noStroke();
    fill(243, 3, 7);
    pushMatrix();
      translate(position.x, position.y, position.z);
      rotateX(rotation.x);
      rotateY(rotation.y);
      rotateZ(rotation.z);
      scale(scale_factor);
      beginShape(TRIANGLES);
        rotateX(PI/6);
        rotateY(PI/6);
        
        vertex(1, 0, (-1)/sqrt(2));
        vertex(-1, 0, (-1)/sqrt(2));
        vertex(0, 1, 1/sqrt(2));
        
        vertex(1, 0, (-1)/sqrt(2));
        vertex(-1, 0, (-1)/sqrt(2));
        vertex(0, -1, 1/sqrt(2));
        
        vertex(-1, 0, (-1)/sqrt(2));
        vertex(0, 1, 1/sqrt(2));
        vertex(0, -1, 1/sqrt(2));
        
        vertex(1, 0, (-1)/sqrt(2));
        vertex(0, 1, 1/sqrt(2));
        vertex(0, -1, 1/sqrt(2));
      endShape();
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