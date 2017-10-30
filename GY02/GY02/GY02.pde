ArrayList<Shape> shapes;
Circle circle;
Rectangle rectangle;

void setup()
{
  size(600, 600);
  
  shapes = new ArrayList<Shape>();
  
  circle = new Circle();
  circle.position.x = 300;
  circle.position.y = 300;
  
  rectangle = new Rectangle();
  rectangle.position.x = 100;
  rectangle.position.y = 300;
}

void draw()
{
   background(255);
   
   circle.detailness = round(3 + 30 * (sin(millis() / 1000.0) + 1) / 2.0);
 
   rectangle.Draw();
   circle.Draw();
   
   for (Shape shape : shapes)
     shape.Draw();
     
   for (Shape shape : shapes)
   {
     shape.Select(false);
     if (shape.Contains(mouseX, mouseY))
     {
       shape.Select(true);
       break;
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