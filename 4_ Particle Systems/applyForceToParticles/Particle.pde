class Particle
{
  PVector loc, acc, vel;
  float mass, life;
  Particle(PVector a)
  {
    loc = a;
    acc = new PVector(0, 0.05);
    vel = new PVector(random(-1, 1), random(-1, 1));
    mass = 1;
    life = random(400);
  }
  void update()
  {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  void applyForce(PVector f)
  {
    f.div(mass);
    acc.add(f);
  }
  void display()
  {
    fill(0, life);
    stroke(255, life);
    ellipse(loc.x, loc.y, mass*20, mass*20);    
    life -= 2;
  }
  boolean isDead()
  {
    return (life <= 0);
  }
}