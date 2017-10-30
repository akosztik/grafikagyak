class CatmulRomSpline extends Curve
{
  void Draw()
  {
    float step = 1.0 / detailness;
    
    beginShape(LINES);
    for (int i = 1; i < controllPoints.size() - 2; ++i)
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
    PVector p0 = controllPoints.get(idx - 1);
    PVector p1 = controllPoints.get(idx - 0);
    PVector p2 = controllPoints.get(idx + 1);
    PVector p3 = controllPoints.get(idx + 2);
    
    PVector e0 = p1.copy().mult(2.0);
    PVector e1 = p2.copy().sub(p0).mult(t);   
    PVector e2 = p0.copy().mult(2.0).sub(p1.copy().mult(5.0)).add(p2.copy().mult(4.0)).sub(p3).mult(t*t);
    PVector e3 = p0.copy().mult(-1).add(p1.copy().mult(3)).sub(p2.copy().mult(3.0)).add(p3).mult(t*t*t);
    
    return e0.copy().add(e1).add(e2).add(e3).mult(0.5);
  }
  
  void AddControllPoint(PVector cp)
  {
    controllPoints.add(cp);
  }
}