class Camera
{    
  float fov = PI/3.0;  
  PVector eye = new PVector(7,7,7);
  PVector lookAt = new PVector(0,0,0);
  PVector up = new PVector(0,-1,0);
  Boolean is_move_forward = false, is_move_backward = false;
  Boolean is_move_left = false, is_move_right = false;
  Boolean is_move_up = false, is_move_down = false;
  PVector last_mouse_position = null;
  
  float speed = 10;
  
  int last_time;
  
  Camera()
  {
    applyCamera();
    last_time = millis();
  }
  
  void setLookAt(PVector newLookAt)
  {
    lookAt = newLookAt.get();
    lookAt.sub(eye);
    lookAt.normalize();
    lookAt.add(eye);
  }
  
  void MoveLeft(Boolean on)
  {
    is_move_left = on;
  }
  
  void MoveRight(Boolean on)
  {
    is_move_right = on;
  }
  
  void MoveForward(Boolean on)
  {
    is_move_forward = on;
  }
  
  void MoveBackward(Boolean on)
  {
    is_move_backward = on;
  }
  
  void MoveUp(Boolean on)
  {
    is_move_up = on;
  }
  
  void MoveDown(Boolean on)
  {
    is_move_down = on;
  }
  
  PVector GetForward()
  {
    PVector forward = lookAt.get();
    forward.sub(eye);
    forward.normalize();
    return forward;
  }
  
  PVector GetLeft()
  {
    PVector forward = GetForward();
    PVector left = up.cross(forward);
    left.normalize();
    return left;
  }
    
  void update()
  {    
      float delta_time = (millis() - last_time) / 1000.0;
      last_time = millis();
    
      if (is_move_forward)
      {
        PVector f = GetForward();
        f.mult(delta_time * speed);
        eye.add(f);
        lookAt.add(f);
        
        applyCamera();
      }
      
      if (is_move_backward)
      {
        PVector b = GetForward();
        b.mult(-delta_time * speed);
        eye.add(b);
        lookAt.add(b);
        
        applyCamera();
      }
      
      if (is_move_left)
      {
        PVector l = GetLeft();
        l.mult(delta_time * speed);
        eye.add(l);
        lookAt.add(l);
        
        applyCamera();
      }
      
      if (is_move_right)
      {
        PVector r = GetLeft();
        r.mult(-delta_time * speed);
        eye.add(r);
        lookAt.add(r);
        
        applyCamera();
      }
      
      if (mousePressed)
      {
        if (last_mouse_position == null)
        {
          last_mouse_position = new PVector(mouseX, mouseY);
        } else
        {
          float dx = -(mouseX - last_mouse_position.x) * delta_time;
          float dy = (mouseY - last_mouse_position.y) * delta_time;
          
          PVector l = GetLeft();
          PVector f1 = GetForward();
          PVector f2 = f1.get();
          PVector u = l.cross(f1);
          
          PVector r1 = rotateAround(f1, u, dx);
          PVector r2 = rotateAround(f2, l, dy);
        
          PVector new_look_at = r1.get();
          new_look_at.add(r2);
          new_look_at.mult(0.5);
          new_look_at.add(eye);
          
          lookAt = new_look_at;
          applyCamera();
          
          last_mouse_position = new PVector(mouseX, mouseY);
      }
        
      } else
        last_mouse_position = null;
  }
  
  void applyCamera()
  {
    // Normalize look at
    lookAt.sub(eye);
    lookAt.normalize();
    lookAt.add(eye);
    
    // Update Camera
    camera( eye.x, eye.y, eye.z,       // eye
        lookAt.x, lookAt.y, lookAt.z,  // lookAt
        up.x,  up.y,   up.z );         // up-vector
   
    perspective(fov, float(width)/float(height),
        0.001, 3000.0);
  }
  
  // rotate v around _axis by ang radians.
  PVector rotateAround(PVector v, PVector _axis, float ang)
  {
   //use normalised values
    PVector axis = new PVector(_axis.x, _axis.y, _axis.z);
    PVector vnorm = new PVector(v.x, v.y, v.z);
    float _parallel = axis.dot(v); // mDot(axis,v); //dot product
    PVector parallel = axis.get(); //multiply all elements by a value
    parallel.mult(_parallel);
    PVector perp = parallel.get(); //subtract one vector from another
    perp.sub(v);
    PVector Cross = v.get().cross(axis); //cross product
    //PVector result = add(parallel,add(mul(Cross,sin(-ang)),mul(perp,cos(-ang))));
    Cross.mult(sin(-ang));
    perp.mult(cos(-ang));
    PVector result = parallel.get();
    result.add(Cross);
    result.add(perp);
    result.mult(-1);
    return result;
  } 
}