class Circle extends Shape
{
  float radius;
  
  Circle(PVector position, float radius)
  {
    this.position = position.get();
    this.radius = radius;
  }
  
  void Draw()
  {
    pushMatrix();
      translate(position.x, position.y);
      rotate(rotation);
      scale(this.scale);
    
      beginShape();
        float angleDiff = 2 * PI / detailness;
        
        for (int i = 0; i <= detailness; ++i)
        {
          float x = sin(angleDiff * i) * radius;
          float y = cos(angleDiff * i) * radius;
          vertex(x,y);
        } 
      endShape();
    
    popMatrix();
  }
  
  Boolean Contains(float x, float y)
  {
    return pow(position.x - x, 2) + pow(position.y - y, 2) < radius * radius;
  }
};