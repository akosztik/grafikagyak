
class Slingshot
{
    Rectangle handle;
    Line rodleft;
    Line rodright;
    Line rodHolderleft;
    Line rodHolderright;
    Circle shotHolder;
    PVector shotHolderMidle;
    int handlerHalf;
  
  Slingshot(int x, int y)
  {   
      handle = new Rectangle(16,150);
      handle.position.x = x;
      handle.position.y = y;
      handlerHalf= x+int(handle.w)/2;
      rodHolderleft = new Line( handlerHalf ,y,handlerHalf-60, y-60);
      rodHolderright = new Line(handlerHalf,y,handlerHalf+60, y-60);
      shotHolderMidle = new PVector(handlerHalf, y-60);
      
      
  }
  
  void Draw(int r,int g, int b)
  {
    handle.fill_color= new PVector(r,g,b);
    handle.Draw();
    rodHolderleft.Draw();
    rodHolderright.Draw();
    
  }


  Boolean Contains(float x, float y)
  {
    if (this.handle.Contains(x, y) || this.rodHolderleft.Contains( x, y)||this.rodHolderright.Contains( x,  y)){
      return true;
    }else{
      return false;
    }
  }  
}