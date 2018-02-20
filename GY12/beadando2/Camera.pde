class Camera
{    
  float fov = PI/3.0;  
  PVector eye = new PVector(10,10,10);
  PVector lookAt = new PVector();
  PVector up = new PVector(0,-1,0);
  
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
  
  void update()
  {    

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