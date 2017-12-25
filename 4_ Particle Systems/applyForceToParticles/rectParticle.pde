class rectParticle extends Particle
{
  rectParticle(PVector a)
  {
    super(a);
  }
  void display()
  {
    fill(255, life);
    stroke(0, life);
    rectMode(CENTER);
    rect(loc.x, loc.y, mass*20, mass*20);    
    life -= 2;
  }
}