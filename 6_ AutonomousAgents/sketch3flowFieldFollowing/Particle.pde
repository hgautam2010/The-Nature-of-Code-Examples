class particle
{
  PVector loc, acc, vel, prevLoc;
  float maxSpeed,r,g,b;
  particle()
  {
    loc = new PVector(random(0, width), random(0, height));
    acc = new PVector(0, 0);
    prevLoc = new PVector(0, 0);
    vel = PVector.random2D();
    if(random(1) < 0.5)
    r = 0;
    else
    r = 0;
    g = 0;
    b = 0;
    maxSpeed = 4;
  }

  void update()
  {
    prevLoc.mult(0);
    prevLoc.add(loc);
    vel.add(acc);
    vel.limit(maxSpeed);
    loc.add(vel);
    acc.mult(0);
  }
  void applyForce(PVector f)
  {
    acc.add(f);
  }
  void follow(PVector[] flowField)
  {
    int x = floor(loc.x/scale);
    int y = floor(loc.y/scale);
    int index = x + y * cols;
    if (index >= rows*cols)
      index = 0;
    PVector f = flowField[index];
    applyForce(f);
  }
  void display()
  {
    update();
    edges();
    stroke(r,g,b,5);
    line(loc.x, loc.y, prevLoc.x, prevLoc.y);
  }
  void edges()
  {
    if (loc.x < 0)
    {
      loc.x = width;
      prevLoc.mult(0);
      prevLoc.add(loc);
    }
    if (loc.x > width)
    {
      loc.x = 0;

      prevLoc.mult(0);
      prevLoc.add(loc);
    }
    if (loc.y < 0)
    {
      loc.y = height;

      prevLoc.mult(0);
      prevLoc.add(loc);
    }
    if (loc.y > height)
    {
      loc.y = 0;

      prevLoc.mult(0);
      prevLoc.add(loc);
    }
  }
}