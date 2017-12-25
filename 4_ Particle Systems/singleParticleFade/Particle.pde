class Particle
{
  PVector loc, acc, vel;
  float life;
  Particle()
  {
    loc = new PVector(width/2,50);
    acc = new PVector(0,0.05);
    vel = new PVector(random(-1,1),random(-1,1));
    life = 200;
  }
  void update()
  {
    vel.add(acc);
    loc.add(vel);
  }
  void display()
  {
    fill(0,life);
    stroke(0,life);
    ellipse(loc.x,loc.y,20,20);
    life -= 2;
  }
  boolean isDead()
  {
    return (life <= 0);
  }
}