//ball class that will be free fall
class ball
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector dest;
  boolean direction;
  float factor;
  int count,x;
  ball()
  {
    x = width/2;
    location = new PVector(x,0);
    velocity = new PVector(0,5);
    acceleration = new PVector(0,-0.5);
    dest = new PVector(x,height);
    factor = 1.5;
    direction = true;
    count = 0;
  }
  void update()
  {
    if(!direction)
    {
      velocity.div(1.017);
    }
    else
    {
      velocity.mult(1.01);
    }
    if(sqrt((location.x-dest.x)*(location.x-dest.x) + (location.y-dest.y)*(location.y-dest.y)) < 5)
    {
      if(direction)
      {
        velocity.mult(-0.9);
        dest.y = dest.y - dest.y/factor;
      }
      else
      {
        velocity.mult(-0.9);
        dest = new PVector(x,height);
      }
      direction = !direction;
      factor *= 1.3;
    }
  }
  void move()
  {
    location.add(velocity);
  }
  void display()
  {
    update();
    move();
    background(50);
    noStroke();
    ellipse(location.x,location.y,20,20);
  }
  boolean check()
  {
    if(count == 310)
      return true;
    count++;
    return false;
  }
}