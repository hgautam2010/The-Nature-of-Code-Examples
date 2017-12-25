class rectParticle extends Particle
{
  rectParticle(float x, float y)
  {
    super(x,y);
  }
  void display()
  {
    fill(0, life);
    stroke(255, life);
    rectMode(CENTER);
    rect(loc.x, loc.y, mass*20, mass*20);    
    life -= 2;
  }
}