Particle p;
void setup()
{
  size(1080, 720);
  p = new Particle();
}
void draw()
{
  if (!p.isDead())
  {
    background(100);
    strokeWeight(5);
    p.display();
    p.update();
  } else
    background(0);
}