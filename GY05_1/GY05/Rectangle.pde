class Rectangle extends Shape
{
  float w, h;
  
  Rectangle(PVector position, float w, float h)
  {
    this.w = w;
    this.h = h;
    this.position = position.get();
  }
  
  void Draw()
  {
    pushMatrix();
      translate(position.x, position.y);
      rotate(rotation);
      scale(this.scale);
      
      beginShape();
        vertex(0, 0);
        vertex(w, 0);
        vertex(w, h);
        vertex(0, h);  
        vertex(0, 0);
      endShape();
    popMatrix();
  }
  
  Boolean Contains(float x, float y)
  {
    float x1 = min(position.x, position.x + w);
    float x2 = max(position.x, position.x + w);
    float y1 = min(position.y, position.y + h);
    float y2 = max(position.y, position.y + h);
    
    return x >= x1 && y >= y1 && x <= x2 && y <= y2;
  }
};