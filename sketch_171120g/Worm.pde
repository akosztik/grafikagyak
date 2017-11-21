class Worm
{
  Circle one;
  Circle two;
  Circle three;

  
  Worm(PVector position, float radius)
  {
    this.two = new Circle(position,radius);
    this.one = new Circle(new PVector(position.x+2*radius,position.y),radius);
    this.three = new Circle(new PVector(position.x-2*radius,position.y),radius);

  }

  void Draw()
  {
    fill(255);
    two.Draw();
    fill(0,255,0);
    one.Draw();
    fill(0,0,255);
    three.Draw();
  }

};