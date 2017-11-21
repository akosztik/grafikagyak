
class Arrow
{
    Line left;
    Line right;
    Line mid;
    int len=30;
    float x;
    float y;
    PVector target;
  
  Arrow(float x, float y, PVector target )
  {   
      this.target=target;
      this.x=x;
      this.y=y;
      left=new Line(0,0,len, 0);
      right= new Line(len, 0, len - 8, -8);
      mid= new Line(len, 0, len - 8, 8);
      
  }
  
  void Draw()
  {
    pushMatrix();
    translate(x, y);
    rotate(atan2(x-target.x,target.y-y)+HALF_PI);
    stroke(250);
    left.Draw();
    right.Draw();
    mid.Draw();
    popMatrix();
  }
}