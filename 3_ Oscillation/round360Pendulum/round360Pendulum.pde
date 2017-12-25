float r, x, y, a, v, acc;
void setup()
{
  size(1080, 720);
  r = 150;
  a = PI/4;
  v = 0.1;
  acc = 0.01;
}
void draw()
{
  background(200);
  x = r * cos(a);
  y = r * sin(a);
  translate(width/2, height/2);
  line(0, 0, x, y);
  ellipse(x, y, 20, 20);
  a = (a + v)%360;
  //v += acc;
}