class Rectangle extends Shape
{
  float w = 50, h = 50;
  
  Rectangle()
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
    
      vertex(position.x - w / 2, position.y - h / 2);  
      vertex(position.x + w / 2, position.y - h / 2);  
      vertex(position.x + w / 2, position.y + h / 2);  
      vertex(position.x - w / 2, position.y + h / 2);  
      vertex(position.x - w / 2, position.y - h / 2);  
    
    endShape();
  }
  
  Boolean Contains(float x, float y)
  {
    return x > position.x - w / 2 && x < position.x + w / 2 &&
      y > position.y - h / 2 && y < position.y + h / 2;
  }  
}