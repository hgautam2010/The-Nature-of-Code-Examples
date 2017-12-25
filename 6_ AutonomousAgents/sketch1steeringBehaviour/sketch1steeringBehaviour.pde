vechile v;
void setup()
{
  size(720, 360);
  v = new vechile(new PVector(width/2, height/2));
}
void draw()
{
  background(100);
  PVector mouse = new PVector(mouseX, mouseY);
  fill(200, 50);
  stroke(0);
  strokeWeight(2);
  ellipse(mouse.x, mouse.y, 40, 40);
  v.seek(mouse);
  v.update();
  v.display();
}