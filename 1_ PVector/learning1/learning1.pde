//PVector example for learning purpose
void setup()
{
  size(500, 300);
}
void draw()
{
  background(255);
  strokeWeight(2);
  stroke(0);
  noFill();
  translate(width/2, height/2);
  //translate(50, 50);  //Another translation
  //pushMatrix(); //Save translation matrix
  //println(height/2);  //Print to the console
  //popMatrix();  //Set saved translation matrix
  ellipse(0, 0, 4, 4);
  //line(0, 0, mouseX - width/2, mouseY - height/2);
  PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  mouse.sub(center);  //Vector subtraction
  //mouse.mult(1.5);  //Scaler multiplication
  mouse.normalize();
  mouse.mult(20);
  line(0,0,mouse.x,mouse.y);
  ellipse(0,0,mouse.mag()*2,mouse.mag()*2);
}