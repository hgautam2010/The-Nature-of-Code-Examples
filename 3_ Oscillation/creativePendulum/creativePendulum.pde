Mover[] move;
spring[] springs;
int pend;
void setup()
{
  size(1080, 720);
  pend = 300;
  move = new Mover[pend];
  springs = new spring[pend];
  int x, i;
  x = 0;
  for (i = 0; i < pend && x < width; ++i)
  {
    x += (int)random(20, 40);
    springs[i] = new spring(x);
    move[i] = new Mover(x, random(200,400));
  }
  pend = i;
}
void draw()
{
  background(100);
  stroke(0);
  strokeWeight(5);
  for (int i = 0; i < pend; i++)
  {
    spring s = springs[i];
    Mover m = move[i];
    line(s.origin.x, s.origin.y, m.loc.x, m.loc.y - m.mass*10);
    PVector vect = s.calculateForce(m);
    m.applyForce(vect);
    m.applyForce(new PVector(0,0.1));
    m.update();
    m.display();
  }
}