class Mover
{
  PVector loc, aVel, aAce;
  float mass; 
  Mover(float x, float y)
  {
    loc = new PVector(x, y);
    aVel = new PVector(0, 0);
    aAce = new PVector(0, 0);
    mass = 3;
  }
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force,mass);
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
    ellipse(loc.x,loc.y,mass*20,mass*20);
  }
}