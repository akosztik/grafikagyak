abstract class Curve
{
  ArrayList<PVector> controllPoints;
  int detailness = 10;

  abstract PVector Eval(int idx, float t);
  abstract void Draw();
  
  Curve()
  {
    controllPoints = new ArrayList<PVector>();
  }
}