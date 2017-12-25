Mover[] b;
PVector f;
void setup()
{
  b = new Mover[5];
  size(1080, 720);
  for (int i = 0; i < 5; i++)
    b[i] = new Mover();
}
void draw()
{
  background(100);
  stroke(0);
  fill(255,100);
  rect(-1,200,width+1,300);
  fill(0,100);
  for (Mover b : b)
  {
      f = new PVector(0, 2);
      f.mult(b.m);
      b.applyForce(f);
      if (b.loc.y > 200 && b.loc.y < 500)
      { 
        f = b.velo.get();
        f.normalize();
        f.mult(-10);
        b.applyForce(f);
      }
      b.display();
  }
}