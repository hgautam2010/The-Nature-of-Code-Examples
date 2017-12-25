float r, x, y, a, v, acc;
void setup()
{
  size(1080, 720);
  r = 250;
  a = 0;
  v = 0.1;
  acc = 0.01;
}
void draw()
{
  background(200);
  x = r * cos(a);
  y = r * sin(a);
  translate(width/2, height/2);
  line(0, 0, x, 0);
  ellipse(x, 0, 20, 20);
  a = a + v;
}