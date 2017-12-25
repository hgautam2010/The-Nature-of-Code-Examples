class particleSystem
{
  ArrayList<Particle> A;
  float x, y;
  particleSystem(float x, float y)
  {
    A = new ArrayList<Particle>();
    this.x = x;
    this.y = y;
  }
  void display()
  {
    if(A.size() < 100)
      A.add(new Particle(x, y));
    for (int i = A.size() - 1; i >= 0; --i)
    {
      Particle p = A.get(i);
      p.display();
      p.update();
      if (p.isDead())
        A.remove(i);
    }
  }
}