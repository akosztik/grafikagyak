
PVector slingshot1left;
PVector slingshotright1;
PVector middle1;
PVector slingshotleft2;
PVector slingshotright2;
PVector middle2;
BezierCurve bezierleft;
BezierCurve bezierright;
Calmutspine sp;
Circle el;
Worm worm;
int deg;

void setup()
{
  size(600, 600);
  slingshot1left= new PVector(60,400);
  middle1=new PVector(60,400);
  slingshotright1= new PVector(120,400);
  //slingshotleft2= new PVector(120,400);
  middle2=new PVector(180,400);
  slingshotright2= new PVector(180,400);
  /*bezierleft=new BezierCurve();
  bezierleft.AddControllPoint(slingshot1left);
  bezierleft.AddControllPoint(slingshotright1);
  bezierleft.AddControllPoint(middle1);
  bezierright=new BezierCurve();
  bezierright.AddControllPoint(middle2);
  bezierright.AddControllPoint(slingshotleft2);
  bezierright.AddControllPoint(slingshotright2);*/
  sp = new Calmutspine();
  sp.AddControllPoint(slingshot1left);
  sp.AddControllPoint(middle1);
  sp.AddControllPoint(slingshotright1);
  //sp.AddControllPoint(slingshotleft2);
  sp.AddControllPoint(middle2);
  sp.AddControllPoint(slingshotright2);
  deg=45;
  worm= new Worm(new PVector(0,0), 6);
  
  
  
}

void draw()
{
   background(255);
   stroke(0);
   if (mousePressed){
     //bezierleft.setControllPoint(new PVector(mouseX, mouseY));
     //bezierright.setControllPoint(new PVector(mouseX, mouseY));
     sp.setControllPoint(new PVector(mouseX, mouseY));
     worm.Draw(mouseX, mouseY);

   
   }
   if (mousePressed==false){
     //bezierleft.setControllPoint(slingshotright1);
     //bezierright.setControllPoint(slingshotleft2);
     sp.setControllPoint(slingshotright1);
   }
   //bezierleft.Draw();
   //bezierright.Draw();
   sp.Draw();
}

void keyPressed()
{
  
}

void mousePressed()
{
    
}

void mouseReleased()
{
 
}