Mover[] m;
//Force applied to ball with respect to mass
void setup()
{
  m = new Mover[50];
  size(1080, 720);
  for (int i = 0; i < m.length; i++)
    m[i] = new Mover();
}
void draw()
{
  background(100);
  stroke(0);
  fill(255,127);
  for (Mover m : m)
  {
    PVector f = new PVector(0, 0.1);
    //f.mult(m.mass);
    m.applyForce(f);
    f = new PVector(0.01, 0);
    m.applyForce(f);
    m.display();
  }
}