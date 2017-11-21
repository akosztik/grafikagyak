Slingshot player1;
Slingshot player2;
int slingdistx=200;
int slingdisty=400;
int slingwidth=16;
boolean hasBeenReleased = false;
String winner = "";
String actualplayer;
PVector press;
PVector release; 
float gravity = 0;
Line string1;
Line string2;

void setup()
{
  size(1200, 600);
  
  //init Slingshot
  player1 = new Slingshot(slingdistx,slingdisty);
  player2 = new Slingshot(width-slingdistx-slingwidth,slingdisty);
  string1 = new Line(slingdistx+slingwidth/2-60,slingdisty-60,slingdistx+slingwidth/2+60,slingdisty-60);
  string2 = new Line(width-slingdistx-slingwidth/2-60,slingdisty-60,width-slingdistx-slingwidth/2+60,slingdisty-60);
  actualplayer = "blue";
  

}

void draw(){

if(mousePressed){

      background(255);
      if (actualplayer == "green"){
        stroke(255,0,0);
        bezier(width-slingdistx-slingwidth/2-60,slingdisty-60,mouseX,mouseY,mouseX,mouseY,width-slingdistx-slingwidth/2+60,slingdisty-60);
        string1.stroke_color=new PVector(255,0,0);
        string1.Draw();
        fill(188, 191, 64);
      }
      if (actualplayer == "blue"){
        stroke(255,0,0);
        bezier(slingdistx+slingwidth/2-60,slingdisty-60,mouseX,mouseY,mouseX,mouseY,slingdistx+slingwidth/2+60,slingdisty-60);
        string2.stroke_color=new PVector(255,0,0);
        string2.Draw();
        fill(172, 199, 255);
      }
      ellipse(mouseX, mouseY, 40, 40);
      player1.Draw(172, 199, 255);
      player2.Draw(188, 191, 64);
}

if(mousePressed==false){
   background(255);
   string1.stroke_color=new PVector(255,0,0);
   string1.Draw();
   string2.stroke_color=new PVector(255,0,0);
   string2.Draw();
   player1.Draw(172, 199, 255);
   player2.Draw(188, 191, 64);
   
   if (winner==""){
     text("this round: "+actualplayer, width/2, height/4);
   }
 }
 
 if(hasBeenReleased){   
    if(actualplayer == "blue"){
        fill(172, 199, 255);
        ellipse(release.x, release.y, 40, 40);
        release.add(press);
        release.y+=gravity;
        gravity+=0.6;
     if (player2.Contains(release.x, release.y)){
       winner = "blue";
     }

   }
   if(actualplayer == "green" ){
         fill(188, 191, 64);
         fill(172, 199, 255);
         ellipse(release.x, release.y, 40, 40);
         release.add(press);
         release.y+=gravity;
         gravity+=0.6;
     if( player1.Contains(release.x, release.y)){
       winner = "green";
     }
   }
   if (exitscreen(release.x, release.y)){
     hasBeenReleased=false;
     println("x: "+release.x+" , y: "+release.y);
        if (actualplayer == "green"){
           actualplayer="blue";
       }else{
           actualplayer="green";
       }
   }
 }

 if(winner!=""){
   textSize(50);
   textAlign(CENTER);
   text("GAMEOVER\nthe winner is: " + winner, width/2, height/2);
 }
 
}

void mousePressed()
{
  press = new PVector(mouseX, mouseY);
}

void mouseReleased(){
  float cSquared;
  if (actualplayer=="blue"){
    cSquared = sqrt(((mouseY-player1.rodHolderleft.endpos.y)*(mouseY-player1.rodHolderleft.endpos.y))+((player1.shotHolderMidle.x-mouseX)*(player1.shotHolderMidle.x-mouseX)))/5;
  }else{
    cSquared = sqrt(((mouseY-player2.rodHolderleft.endpos.y)*(mouseY-player2.rodHolderleft.endpos.y))+((player2.shotHolderMidle.x-mouseX)*(player2.shotHolderMidle.x-mouseX)))/5;
  }
  release = new PVector(mouseX, mouseY);
  press.sub(release);
  press.normalize();
  press.mult(cSquared);
  hasBeenReleased = true;
  gravity = 0;
}

boolean exitscreen(float x, float y){
  boolean b= false;
  if (x<0 || x>width || y<0 || y>height){
    b=true;
    println("-----------------"+x+" , " +y);
  }
  return b; 
}