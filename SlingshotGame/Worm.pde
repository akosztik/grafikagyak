class Worm
{
  Circle one;
  Circle two;
  Circle three;
  PVector position;
  float x=0;
  float y=0;
  
  Worm(PVector position, float radius)
  {
    this.two = new Circle(position,radius);
    this.one = new Circle(new PVector(position.x+2*radius,position.y),radius);
    this.three = new Circle(new PVector(position.x-2*radius,position.y),radius);
    this.position=position;
  }
  void Draw(float x,float y)
  {
    this.x=x;
    this.y=y;
     pushMatrix();
     translate(x,y);
     rotate(radians(frameCount*10));
      fill(255);
      two.Draw();
      fill(0,255,0);
      one.Draw();
      fill(0,0,255);
      three.Draw();
     popMatrix();

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