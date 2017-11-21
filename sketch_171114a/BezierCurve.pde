class BezierCurve extends Curve
{
  void Draw()
  {
    float step = 1.0 / detailness;
    
    beginShape(LINES);
    for (int i = 0; i < controllPoints.size()-2; i += 2)
    {
      for (float t = 0.0; t <= 1.0; t += step)
      {
        PVector pt1 = Eval(i, t);
        PVector pt2 = Eval(i, t + step);
        vertex(pt1.x, pt1.y);
        vertex(pt2.x, pt2.y);
      }
    }
    endShape();    
  }
  
  PVector Eval(int idx, float t)
  {
    PVector p0 = controllPoints.get(idx);
    PVector p1 = controllPoints.get(idx + 1);
    PVector p2 = controllPoints.get(idx + 2);
    
    PVector e0 = p0.copy().mult((1-t) * (1-t));
    PVector e1 = p1.copy().mult(2 * t * (1-t));
    PVector e2 = p2.copy().mult(t * t);
    
    return e0.copy().add(e1).add(e2);
    
  }
  
  void AddControllPoint(PVector cp)
  {
    controllPoints.add(cp);
  } 
    void setControllPoint(PVector cp)
  {
    controllPoints.set(1,cp);
  } 
}