PVector origin;
Mover bob;
float restLength;
void setup()
{
  size(1080, 720);
  restLength = 300;
  origin = new PVector(width/2, 0);
  bob = new Mover(width/2, 240);
}
void draw()
{
  background(100);
  stroke(0);
  strokeWeight(5);
  line(origin.x, origin.y, bob.loc.x, bob.loc.y);

  PVector spring = PVector.sub(bob.loc, origin);
  float currentLength = spring.mag();
  spring.normalize();
  float stretch = currentLength - restLength; 
  float k = -0.1;
  spring.mult(k * stretch);
  bob.applyForce(spring);
  if (mousePressed)
  {
    bob.applyForce(new PVector(0.1, 0));
  }
  bob.applyForce(new PVector(0, 0.1));
  bob.update();
  bob.display();
}