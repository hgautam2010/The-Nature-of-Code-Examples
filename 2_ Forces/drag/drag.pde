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
  background(150);
  stroke(0);
  fill(30,100);
  rect(-1,300,width+1,height);
  fill(0,100);
  for (Mover b : b)
  {
      f = new PVector(0, 1);
      f.mult(b.m);
      b.applyForce(f);
      if (b.loc.y > 300 && b.loc.y < height)
      { 
        f = b.velo.get();
        f.normalize();
        float speed = b.velo.mag();
        f.mult(-0.025*speed*speed);
        b.applyForce(f);
      }
      b.display();
  }
}