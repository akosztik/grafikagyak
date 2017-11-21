abstract class Shape
{
  PVector position = new PVector();
  int detailness = 20;
  Boolean selected = false;
  
  PVector fill_color = new PVector(255,255,255);
  PVector stroke_color = new PVector(255,255,255);
  
  PVector sel_fill_color = new PVector(255,0,0);
  PVector sel_stroke_color = new PVector(0, 0, 0);
  
  Shape(){}
  
  abstract void Draw();
  abstract Boolean Contains(float x, float y);
  
  void Select(Boolean on) { selected = on; }  
  Boolean Contains(PVector vec) { return Contains(vec.x, vec.y); }
}