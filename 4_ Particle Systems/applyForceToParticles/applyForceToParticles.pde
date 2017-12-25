ArrayList<Particle> A;
void setup()
{
  size(1080, 720);
  A = new ArrayList<Particle>();
}
void draw()
{
  background(100);
  if (A.size() < 200)
  {
    if (random(0, 1) < 0.5)
      A.add(new rectParticle(new PVector(width/2, 50)));
    else
      A.add(new Particle(new PVector(width/2, 50)));
  }
  for (int i = A.size() - 1; i >= 0; --i)
  {
    Particle p = A.get(i);
    p.display();
    p.applyForce(new PVector(0,0.05));
    if(mousePressed)
    {
      p.applyForce(new PVector(0.1,0));
    }
    p.update();
    if (p.isDead())
      A.remove(i);
  }
}