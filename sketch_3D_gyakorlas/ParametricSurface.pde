abstract class ParametricSurface
{
  int detailness_u = 20;
  int detailness_v = 20;
  
  PImage tex;
  PVector tex_offset = new PVector();
  
  abstract PVector GetPosition(float u, float v);
  abstract PVector GetNormal(float u, float v);
  abstract PVector GetDiffU(float u, float v);
  abstract PVector GetDiffV(float u, float v);
  
  void Draw()
  {
    float step_u = 1.0 / detailness_u;
    float step_v = 1.0 / detailness_v;
    
    noStroke();
    beginShape(TRIANGLES);
      textureMode(NORMAL);
      textureWrap(REPEAT);
      texture(tex);
    
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

          
          vertex(p1.x, p1.y, p1.z, u1 + tex_offset.x, v1 + tex_offset.y);
          normal(n1.x, n1.y, n1.z);     
          vertex(p2.x, p2.y, p2.z, u2 + tex_offset.x, v1 + tex_offset.y);
          normal(n2.x, n2.y, n2.z);
          vertex(p1.x, p1.y, p1.z, u1 + tex_offset.x, v1 + tex_offset.y);
          normal(n1.x, n1.y, n1.z);
          vertex(p3.x, p3.y, p3.z, u1 + tex_offset.x, v2 + tex_offset.y);
          normal(n3.x, n3.y, n3.z);
          
          vertex(p2.x, p2.y, p2.z, u2 + tex_offset.x, v1 + tex_offset.y);
          normal(n2.x, n2.y, n2.z);
          vertex(p4.x,p4.y, p4.z, u2 + tex_offset.x, v2 + tex_offset.y);
          normal(n4.x, n4.y, n4.z);
          vertex(p3.x, p3.y, p3.z, u1 + tex_offset.x, v2 + tex_offset.y);
          normal(n3.x, n3.y, n3.z);
          
    
          
         
        }
      }
    endShape();
  }
}