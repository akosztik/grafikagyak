class Rectangle extends Shape
{
  float w , h ;
  
  Rectangle(int w, int h)
  {
    this.w=w;
    this.h=h;
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
      vertex(position.x , position.y);  
      vertex(position.x + w , position.y );  
      vertex(position.x + w , position.y + h );  
      vertex(position.x , position.y + h );  
      vertex(position.x , position.y );  
    
    endShape();
  }
  
  Boolean Contains(float x, float y)
  {
    return x > position.x  && x < position.x + w  &&
      y > position.y  && y < position.y + h ;
  }  
}