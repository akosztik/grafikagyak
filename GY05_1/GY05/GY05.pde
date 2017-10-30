Base selectedBase;
PVector offset;
Rectangle selectionRectangle;

ArrayList<Base> basis;
CatmulRomSpline spline;
BezierCurve bezier;

void setup()
{
  size(600, 600);
  
  basis = new ArrayList<Base>();
  spline = new CatmulRomSpline();
  bezier = new BezierCurve();
}

void draw()
{
   background(255);
   stroke(0);
    
   for (Base base : basis)
   {
     fill(100,100,100);
     if (base.Contains(mouseX, mouseY))
       fill(0,0,255);
     if (base == selectedBase)
       fill(0,255,0);
     base.Draw();
   }
   
   if (selectedBase != null)
   {
     selectedBase.SetPosition(mouseX + offset.x, mouseY + offset.y);
   }
   
   if (selectionRectangle != null)
   {
     noFill();
     stroke(100);
     
     selectionRectangle.w = mouseX - selectionRectangle.position.x;
     selectionRectangle.h = mouseY - selectionRectangle.position.y;  
     selectionRectangle.Draw();
     
     for (Base base : basis)
     {
       if (selectionRectangle.Contains(base.position.x, base.position.y))
       {
         fill(0,0,255);
         base.Draw();
       }
     }
   }
   
   stroke(0, 0, 255);
   spline.Draw();
   
   stroke(255, 0, 0);
   bezier.Draw();
}

void keyPressed()
{
}

void mousePressed()
{
   Boolean hasIt = false;
  
   for (Base base : basis)
   {
     if (base.Contains(mouseX, mouseY))
     {
       selectedBase = base;
       offset = new PVector(base.position.x - mouseX, base.position.y - mouseY);
       hasIt = true;
       break;
     }
   }  
   
   if (!hasIt)
   {
     if (!keyPressed)
     {
       Base base = new Base(new PVector(mouseX, mouseY));
       basis.add(base);
       
       spline.AddControllPoint(base.position);
       bezier.AddControllPoint(base.position);
     } else
     {
       selectionRectangle = new Rectangle(new PVector(mouseX, mouseY), 0, 0);
     } 
   }
}

void mouseReleased()
{
  selectedBase = null;
  selectionRectangle = null;
}

void DrawCustomRect(float x, float y, float w, float h)
{
  beginShape();
    vertex(x, y);
    vertex(x + w, y);
    vertex(x + w, y + h);
    vertex(x, y + h);  
    vertex(x, y);
  endShape();
}

void DrawCustomCircle(float cx, float cy, float radius, int detailness)
{
  beginShape();
    float angleDiff = 2 * PI / detailness;
    
    for (int i = 0; i <= detailness; ++i)
    {
      float x = sin(angleDiff * i) * radius + cx;
      float y = cos(angleDiff * i) * radius + cy;
      vertex(x,y);
    } 
  endShape();
}