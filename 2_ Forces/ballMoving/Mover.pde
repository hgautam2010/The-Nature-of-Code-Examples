//Ball's class say Mover
class Mover
{
  PVector loc,acce,velo;
  float mass;
  Mover()
  {
    loc = new PVector(0,0);
    acce = new PVector(0,0);
    velo = new PVector(0,0);
    mass = random(1,3);
  }
  void update()
  {
    velo.add(acce);
    loc.add(velo);
    acce.mult(0);
  }
  void applyForce(PVector force)
  {
    PVector f = PVector.div(force,mass);
    acce.add(f);
  }
  void display()
  {
    update();
    edges();
    ellipse(loc.x,loc.y,mass*20,mass*20);
  }
  void edges()
  {
    if(loc.x > width)
    {
      loc.x = width;
      velo.x *= -1;
    }
    else if(loc.x < 0)
    {
      loc.x = 0;
      velo.x *= -1;
    }
    if(loc.y > height)
    {
      loc.y = height;
      velo.y *= -1;
    }
    else if(loc.y < 0)
    {
      loc.y = 0;
      velo.y *= -1;
    }
  }
}