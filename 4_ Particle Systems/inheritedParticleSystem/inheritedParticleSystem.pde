ArrayList<Particle> A;
void setup()
{
  size(1080, 720);
  A = new ArrayList<Particle>();
}
void draw()
{
  background(100);
  if(A.size() < 200)
  {
    if(random(0,1) < 0.5)
      A.add(new rectParticle(width/2,50));
    else
      A.add(new Particle(width/2,50));
  }
  for(int i = A.size() - 1; i >= 0; --i)
  {
    Particle p = A.get(i);
    p.display();
    p.update();
    if(p.isDead())
    {
      A.remove(i);
    }
  }
}