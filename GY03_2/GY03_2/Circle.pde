class Circle extends Shape
{
  float radius = 50;
  
  Circle()
  {
  }
  
  void Draw()
  {
    fill(fill_color.x, fill_color.y, fill_color.z);
    stroke(stroke_color.x, stroke_color.y, stroke_color.z);
    if (selected)
    {
      fill(sel_fill_color.x, sel_fill_color.y, sel_fill_color.z);
      stroke(sel_stroke_color.x, sel_stroke_color.y, sel_stroke_color.z);
    }
    
    beginShape();
    
      float step = 2 * PI / detailness;
      for (int i = 0; i <= detailness; ++i)
      {
        float alpha = i * step;
        float x = position.x + radius * sin(alpha);
        float y = position.y + radius * cos(alpha);
        vertex(x,y);  
      }    
    
    endShape();
  }
  
  Boolean Contains(float x, float y)
  {
    float dx = pow(position.x - x, 2);
    float dy = pow(position.y - y, 2);
    return sqrt(dx + dy) < radius;
  }  
}