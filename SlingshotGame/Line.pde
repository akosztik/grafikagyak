class Line extends Shape
{  
  PVector endpos = new PVector();
  
  
  Line(int x1, int y1, float x2, float y2)
  {
    this.position.x=x1;
    this.position.y=y1;
    this.endpos.x=x2;
    this.endpos.y=y2;
  }
  
  void Draw()
  {
    
    stroke(stroke_color.x, stroke_color.y, stroke_color.z);
    if (selected)
    {
      
      stroke(sel_stroke_color.x, sel_stroke_color.y, sel_stroke_color.z);
    }
    
    beginShape();
    
      vertex(position.x, position.y);  
      vertex(endpos.x , endpos.y);  

    
    endShape();
  }
  
  Boolean Contains(float x, float y)
  {
    return x > min(endpos.x,position.x) && x < max(endpos.x,position.x) &&
      y > min(endpos.y,position.y) && y < max(endpos.y,position.y);
  }  
}