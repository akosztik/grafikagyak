abstract class ParametricSurface
{
  int detailness_u = 20;
  int detailness_v = 20;
  
  abstract PVector GetPosition(float u, float v);
  abstract PVector GetNormal(float u, float v);
  
  void Draw()
  {
    float step_u = 1.0 / detailness_u;
    float step_v = 1.0 / detailness_v;
    
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
          
          vertex(p1.x, p1.y, p1.z);
          vertex(p2.x, p2.y, p2.z);
          vertex(p3.x, p3.y, p3.z);
          
          vertex(p2.x, p2.y, p2.z);
          vertex(p4.x, p4.y, p4.z);
          vertex(p3.x, p3.y, p3.z);
        }
      }
    endShape();
  }
}