//import processing.opengl.*;

int zoom   = 75;
int detail = 25;
int speed  = 20;
int rough  = 90;
int radius = 500;

Rock rock;

void setup()
{
  size(800, 800, P3D);
  textFont(createFont("Ariel", 15));
  textMode(SCREEN);
  initRock();
  smooth();

}

void mousePressed()
{
  initRock();
}

void keyPressed()
{
  switch(key == CODED ? keyCode : key)
  {
    case UP:    rock.detail = (detail = min(detail +  1,  100)); break;
    case DOWN:  rock.detail = (detail = max(detail -  1,    5)); break;
    case RIGHT: rock.speed  = (speed  = min(speed  +  1,  100)) / 500.0; return;
    case LEFT:  rock.speed  = (speed  = max(speed  -  1,    0)) / 500.0; return;
    case 's':   rock.radius = (radius = min(radius + 10, 1000)); break;
    case 'S':   rock.radius = (radius = max(radius - 10,   10)); break;
    case 'r':   rock.rough  = (rough  = min(rough  +  1,  100)) / 100.0; break;
    case 'R':   rock.rough  = (rough  = max(rough  -  1,    0)) / 100.0; break;
    default: return;
  }
  rock.rebuild = true;
}

void initRock()
{
  rock = new Rock(radius, rough / 100.0, speed / 500.0, detail);
}

void draw()
{
  background(0);
  lights();
  translate(width / 2, height / 2, -map(zoom, 100, 1, -600, 5000));
  rock.draw();
  camera();
  text("Detail: "    + detail, 5, 15);
  text("Radius: "    + radius, 5, 30);
  text("Roughness: " + rough,  5, 45);
  text("Spin: "      + speed,  5, 60);
  text("Zoom: "      + zoom,   5, 75);
  text("Mouse Click: Generate new rock.",   5, height - 90);
  text("Mouse Scroll: Change camera zoom.", 5, height - 75);
  text("Up/Down: Change model detail.",     5, height - 60);
  text("Right/Left: Change spin speed.",    5, height - 45);
  text("s/shift-s: Change rock size.",      5, height - 30);
  text("r/shift-r: Change roughness.",      5, height - 15);
}