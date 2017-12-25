class Mover
{
  PVector loc, aVel, aAce;
  float mass;
  float r,g,b;
  Mover(float x, float y)
  {
    loc = new PVector(x, y);
    aVel = new PVector(0, 0);
    aAce = new PVector(0, 0);
    mass = random(2,4);
    r = random(255);
    g = random(255);
    b = random(255);
  }
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass*10);
    aAce.add(f);
  }
  void update()
  {
    aVel.add(aAce);
    loc.add(aVel);
    aAce.mult(0);
  }
  void display()
  {
    fill(r,g,b,100);
    ellipse(loc.x,loc.y,mass*20,mass*20);
  }
}