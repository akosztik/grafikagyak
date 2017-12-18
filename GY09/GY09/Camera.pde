class Camera
{
  float fov = PI/3.0;

  float speed = 0.05;
  float angular_speed = 1.0;

  PVector prevMouse = new PVector(mouseX,mouseY);
  PVector mousePrev = new PVector(mouseX, mouseY);
  
  PVector eye = new PVector(6,6,6);
  PVector lookAt = new PVector(0,0,0);
  PVector up = new PVector(0,-1,0);
  
  void setLookAt(PVector newLookAt)
  {
    lookAt = newLookAt.get();
  }
  
  PVector getForward()
  {
      PVector forward = lookAt.get();
      forward.sub(eye);
      forward.normalize();
      return forward;
  }
  
  void update()
  {
    // Update camera with keyboard
    if(keyPressed)
    {
      PVector forward = getForward();     
      PVector up2 = up.get();
      PVector side = up2.cross(forward);
     
      forward.mult(speed);
      side.mult(speed);
      up2.mult(speed);
   
      switch(key)
      {
        case 'w':
          eye.add(forward);
          lookAt.add(forward);
          break;
        case 's':
          eye.sub(forward);
          lookAt.sub(forward);
          break;
        case 'a':
          eye.add(side);
          lookAt.add(side);
          break;
        case 'd':
          eye.sub(side);
          lookAt.sub(side);
          break;
        case 'q':
          eye.add(up2);
          lookAt.add(up2);
          break;
        case 'e':
          eye.sub(up2);
          lookAt.sub(up2);
          break;
      }
    }
  
    // Update camera with mouse movement
    PVector currMouse = new PVector(mouseX, mouseY);
    PVector diffMouse = currMouse.get();
    diffMouse.sub(prevMouse);
    prevMouse = currMouse;
   
    if(diffMouse.mag() > 0)
    {
      PVector elore = getForward();
   
      PVector up2 = up.get();
      PVector oldalra = up2.cross(elore);
      PVector felfele = oldalra.cross(elore);
     
      up2.mult(angular_speed * diffMouse.y / height * 2);
      oldalra.mult(angular_speed * diffMouse.x / width * 2);
     
      lookAt.sub(eye);
      lookAt.normalize();
     
      lookAt.add(up2);
      lookAt.sub(oldalra);
     
      lookAt.normalize();
      lookAt.add(eye);
    }
    
    applyCamera();
  }
  
  void applyCamera()
  {
    camera( eye.x, eye.y, eye.z,       // eye
        lookAt.x, lookAt.y, lookAt.z,  // lookAt
        up.x,  up.y,   up.z );         // up-vector
   
    perspective(fov, float(width)/float(height),
        0.00000000000000001, 3000.0);
  }
}
