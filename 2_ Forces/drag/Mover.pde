class Mover
{
  PVector loc, acce, velo;
  float m;
  Mover()
  {
    loc = new PVector(random(width), 0);
    acce = new PVector(0, 0);
    velo = new PVector(0, 0);
    m = random(0.3,3);
  }
  void update()
  {
    velo.add(acce);
    loc.add(velo);
    acce.mult(0);
  }
  void applyForce(PVector f)
  {
    f.div(m);
    acce.add(f);
  }
  void display()
  {
    update();
    edges();
    ellipse(loc.x,loc.y,m*20,m*20);
  }
  void edges()
  {
    if(loc.x < 0 || loc.x > width )
    {
      loc.x = ((loc.x < 0)?0:width);
      velo.x *= -1;
    }
    if(loc.y < 0 || loc.y > height )
    {
      loc.y = ((loc.y < 0)?0:height);
      velo.y *= 0;
    }
  }
}