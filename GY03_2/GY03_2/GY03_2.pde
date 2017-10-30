ArrayList<Shape> shapes;
SinWave wave;

void setup()
{
  size(600, 600);
  
  shapes = new ArrayList<Shape>();
  wave = new SinWave();
}

void draw()
{
   background(255);
   
   wave.Draw();
      
   for (Shape shape : shapes)
     shape.Draw();
     
   for (Shape shape : shapes)
   {
     shape.Select(false);
     if (shape.Contains(mouseX, mouseY))
     {
       shape.Select(true);
     }
   }  
}

void keyPressed()
{
  
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
  } else
  {
    Shape shape;
    if (millis() % 2 == 0)
      shape = new Circle();
    else 
      shape = new Rectangle();
    shape.position.x = mouseX;
    shape.position.y = mouseY;  
    
    shapes.add(shape);
  }
}