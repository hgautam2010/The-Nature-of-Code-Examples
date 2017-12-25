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
    A.add(new Particle());
  for(int i = A.size() - 1; i >= 0; --i)
  {
    Particle p = A.get(i);
    p.display();
    p.update();
    if(p.isDead())
      A.remove(i);
  }
}