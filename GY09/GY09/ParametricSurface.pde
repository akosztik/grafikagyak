abstract class ParametricSurface
{
  float detailness = 10;
  float time;
  PImage tex = null;
  PVector tex_offset = new PVector(0,0);
   
  ParametricSurface()
  {
    time = 0;
  }
 
  void setTime(float _t) { time = _t; }
  void setTexture(PImage _tex) { tex = _tex; }
        
  abstract PVector GetPosition(float u, float v); 
  abstract PVector GetNormal(float u, float v); 
  
  PVector GetTexCoords(float u, float v)
  {
    if (tex != null)
    {
      u = (u + tex_offset.x) * tex.width;
      v = (v + tex_offset.y) * tex.height;
    }
    
    return new PVector(u, v);
  }
  
  void setDetailness(float d)
  {
    detailness = d;
  }
 
  void draw()
  {
    noStroke();
    beginShape(TRIANGLES); // TRIANGLES "primitív fajta"
  
    if (tex != null)
      texture(tex);
  
    for (int i = 0; i < detailness; ++i)
    {
      for (int j = 0; j < detailness; ++j)
      {
        PVector p1 = GetPosition(i / detailness, j / detailness);
        PVector p2 = GetPosition((i+1) / detailness, j / detailness);
        PVector p3 = GetPosition(i / detailness, (j+1) / detailness);
        PVector p4 = GetPosition((i+1) / detailness, (j+1) / detailness);
        
        PVector n1 = GetNormal(i / detailness, j / detailness);
        PVector n2 = GetNormal((i+1) / detailness, j / detailness);
        PVector n3 = GetNormal(i / detailness, (j+1) / detailness);
        PVector n4 = GetNormal((i+1) / detailness, (j+1) / detailness);
             
        PVector t1 = GetTexCoords(i / detailness, j / detailness);
        PVector t2 = GetTexCoords((i+1) / detailness, j / detailness);
        PVector t3 = GetTexCoords(i / detailness, (j+1) / detailness);
        PVector t4 = GetTexCoords((i+1) / detailness, (j+1) / detailness);
             
        // Háromszög 1
        vertex(p1.x, p1.y, p1.z, t1.x, t1.y);
        normal(n1.x, n1.y, n1.z);
        vertex(p2.x, p2.y, p2.z, t2.x, t2.y);
        normal(n2.x, n2.y, n2.z);
        vertex(p3.x, p3.y, p3.z, t3.x, t3.y); 
        normal(n3.x, n3.y, n3.z);
     

        // Háromszög 2
        vertex(p4.x, p4.y, p4.z, t4.x, t4.y);
        normal(n1.x, n1.y, n1.z);
        vertex(p3.x, p3.y, p3.z, t3.x, t3.y);
        normal(n3.x, n3.y, n3.z);
        vertex(p2.x, p2.y, p2.z, t2.x, t2.y);
        normal(n2.x, n2.y, n2.z);
      }
    }        
    endShape();  
  }
}
