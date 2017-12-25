void setup()
{
  size(1080,720);
}
void draw()
{
  background(255);
  noFill();
  drawCircle(width/2,height/2,250);
}
void drawCircle(float x, float y, float d)
{
  if(d < 5)
    return;
  ellipse(x,y,d,d);
  drawCircle(x+d/2,y,d/2);
  drawCircle(x-d/2,y,d/2);
}