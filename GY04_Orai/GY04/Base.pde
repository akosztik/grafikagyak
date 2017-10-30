class Base
{
  ArrayList<Lightning> lightnings;
  Circle circle;
  PVector position;
  
  Base(PVector _position)
  {
    position = _position.copy();
    lightnings = new ArrayList<Lightning>();
    circle = new Circle(position, 10);
  }
  
  void Draw()
  {
    for (int i = 0; i < lightnings.size(); ++i)  
      lightnings.get(i).Draw();
    circle.Draw();
  }
  
  Boolean Contains(float x, float y)
  {
    return circle.Contains(x, y);
  }
  
  void AddLightning(Lightning l)
  {
    lightnings.add(l);
  }
  
  void SetPosition(float x, float y)
  {
    position.x = x;
    position.y = y;
    circle.position.x = x;
    circle.position.y = y;
  }
}