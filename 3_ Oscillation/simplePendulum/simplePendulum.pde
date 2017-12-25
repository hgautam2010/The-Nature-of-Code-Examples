PVector origin, bob;
float len, angle, aVel, aAcc;
void setup()
{
  size(1080, 720);
  len = 300;
  origin = new PVector(width/2, 0);
  bob = new PVector(width/2, len);
  angle = PI/4;
  aVel = 0;
  aAcc = 0;
}
void draw()
{
  background(100);
  stroke(0);
  strokeWeight(5);

  bob.x = len * sin(angle);
  bob.y = len * cos(angle);
  bob.add(origin);

  line(origin.x, origin.y, bob.x, bob.y);
  ellipse(bob.x, bob.y, 40, 40);

  aAcc = -0.01 * sin(angle);
  angle += aVel;
  aVel += aAcc;
  aVel *= 0.99;
}