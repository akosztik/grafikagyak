class ParametricSphere 
{
  float r;
  int detailness_u ;
  int detailness_v ;
  int random;
  float speed = random(2000, 5000);
 
  ParametricSphere(int meret, int detailness, int randomsthg) {
    r = meret;
    detailness_u = detailness;
    detailness_v = detailness;
    random = randomsthg;
  }
  
  PVector GetNormal(float u, float v)
  {
    PVector pos = GetPosition(u, v);
    pos.normalize();
    
    return pos;
  }
  
  PVector GetDiffU(float u, float v)
  {
    return new PVector();
  }
  
  PVector GetDiffV(float u, float v)
  {
    return new PVector();
  }
 
  PVector GetPosition(float u, float v)
  {
    u *= r*3.14159265;
    v *= 3.14159265;
    float j=0,k=0;
    j *= random*3.14159265;
    k *= 3.14159265;
    
  
    return new PVector(
      r * sin(v+k) * cos(u+j),
      r * cos(v+k)         ,
      r * sin(v+k) * sin(u+j)
    );
  }
  void Draw()
  {
    float step_u = 1.0 / detailness_u;
    float step_v = 1.0 / detailness_v;
    rotateX(millis() / speed);
    rotateY(millis() / speed);
    rotateZ(millis() / speed);
    noStroke();
    fill(0,0,255);
    beginShape(TRIANGLES);
    
      for (int i = 0; i < detailness_v; ++i)
      {
        for (int j = 0; j < detailness_u; ++j)
        {
          float u1 = j * step_u;
          float v1 = i * step_v;
          float u2 = (j + 1) * step_u;
          float v2 = (i + 1) * step_v;
          
          PVector p1 = GetPosition(u1, v1);
          PVector p2 = GetPosition(u2, v1);
          PVector p3 = GetPosition(u1, v2);
          PVector p4 = GetPosition(u2, v2);
          PVector n1 = GetNormal(u1, v1);
          PVector n2 = GetNormal(u2, v1);
          PVector n3 = GetNormal(u1, v2);
          PVector n4 = GetNormal(u2, v2);
                    
          vertex(p1.x, p1.y, p1.z);
          normal(n1.x, n1.y, n1.z);          
          vertex(p2.x, p2.y, p2.z);
          normal(n2.x, n2.y, n2.z);
          vertex(p3.x, p3.y, p3.z);
          normal(n3.x, n3.y, n3.z);
          
          vertex(p2.x, p2.y, p2.z);
          normal(n2.x, n2.y, n2.z);
          vertex(p4.x, p4.y, p4.z);
          normal(n4.x, n4.y, n4.z);
          vertex(p3.x, p3.y, p3.z);
          normal(n3.x, n3.y, n3.z);
        }
      }
    endShape();
  }
}