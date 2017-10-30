class Camera
{    
  float fov = PI/3.0;  
  PVector eye = new PVector(7,7,7);
  PVector lookAt = new PVector(0,0,0);
  PVector up = new PVector(0,-1,0);
  Boolean is_move_forward = false, is_move_backward = false;
  Boolean is_move_left = false, is_move_right = false;
  Boolean is_move_up = false, is_move_down = false;
  
  Camera()
  {
    applyCamera();
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
    
  void update()
  {    
      if (is_move_forward)
      {
        PVector f = GetForward();
        eye.add(f);
        lookAt.add(f);
        
        applyCamera();
      }
      
      if (is_move_backward)
      {
        PVector b = GetForward();
        b.mult(-1);
        eye.add(b);
        lookAt.add(b);
        
        applyCamera();
      }
      
      if (is_move_left)
      {
      }
      
      if (is_move_right)
      {
      }
      
      if (mousePressed)
      {
      }
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
    PVector parallel = axis.get().mult(_parallel); //multiply all elements by a value
    PVector perp = parallel.get().sub(v); //subtract one vector from another
    PVector Cross = v.get().cross(axis); //cross product
    //PVector result = add(parallel,add(mul(Cross,sin(-ang)),mul(perp,cos(-ang))));
    PVector result = parallel.add(Cross.mult(sin(-ang)).add(perp.mult(cos(-ang))));
    
    return result.mult(-1);
  } 
}