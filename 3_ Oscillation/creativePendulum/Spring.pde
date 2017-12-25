class spring
{
  PVector origin;
  float restLength, k;
  spring(float x)
  {
    origin = new PVector(x,0);
    restLength = random(200,400);
    k = -0.05;
  }
  PVector calculateForce(Mover m)
  {
    PVector vect = PVector.sub(m.loc, origin);
    float currentLength = vect.mag();
    vect.normalize();
    float stretch = currentLength - restLength;
    vect.mult(k * stretch);
    return vect;
  }
}