class CatmulRomSpline extends Curve
{
  void draw()
  {
    beginShape(LINES);
    for (int i = 0; i < controllPoints.size() - 3; i += 1)
    {      
      for (int j = 0; j < detailness; ++j)
      {
        float t1  = j / (float)detailness;
        float t2  = (j+1) / (float)detailness;
        PVector pt1 = eval(t1, i);
        PVector pt2 = eval(t2, i); 
        
        vertex(pt1.x, pt1.y, pt1.z);
        vertex(pt2.x, pt2.y, pt2.z);
      }
    }
    endShape();
  }
  
  PVector eval(float t, int cIdx)
  {
    PVector pt1 = controllPoints.get(cIdx).get();    
    PVector pt2 = controllPoints.get(cIdx+1).get();    
    PVector pt3 = controllPoints.get(cIdx+2).get();
    PVector pt4 = controllPoints.get(cIdx+3).get();
    
    PVector e1 = PVector.mult(pt2, 2);    
    PVector e2 = PVector.mult(PVector.sub(pt3, pt1), t);    
    PVector e3 = PVector.mult(PVector.sub(PVector.add(PVector.sub(PVector.mult(pt1, 2), PVector.mult(pt2, 5)), PVector.mult(pt3, 4)), pt4), t*t);  
    PVector e4 = PVector.mult(PVector.add(PVector.sub(PVector.sub(PVector.mult(pt2, 3), pt1), PVector.mult(pt3, 3)), pt4), t*t*t);  
    
    return PVector.mult(PVector.add(PVector.add(PVector.add(e1, e2), e3), e4), 0.5);
  }
} 