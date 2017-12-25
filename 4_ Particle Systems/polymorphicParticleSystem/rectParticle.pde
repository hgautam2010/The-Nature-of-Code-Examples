class rectParticle extends Particle
{
  rectParticle(float x, float y)
  {
    super(x,y);
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