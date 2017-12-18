abstract class Curve
{
    ArrayList<PVector>  controllPoints;
    int detailness;
  
    Curve()
    {
      controllPoints = new ArrayList<PVector>();
      detailness = 10;
    }
  
    void AddPoint(PVector pt)
    {
      controllPoints.add(pt.get());
    }
    
    void RemoveLastPoint()
    {
      controllPoints.remove(controllPoints.size() - 1);
    }
    
    int GetPointNumber()
    {
      return controllPoints.size();
    }
  
    PVector eval(float t, int cIdx)
    {
      return new PVector();
    }
  
    void draw()
    {
    }
}
  