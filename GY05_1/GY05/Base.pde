class Base
{
  Circle circle;
  PVector position;
  
  Base(PVector _position)
  {
    position = _position.copy();
    circle = new Circle(position, 10);
  }
  
  void Draw()
  {
    circle.Draw();
  }
  
  Boolean Contains(float x, float y)
  {
    return circle.Contains(x, y);
  }
  
  void SetPosition(float x, float y)
  {
    position.x = x;
    position.y = y;
    circle.position.x = x;
    circle.position.y = y;
  }
}