class ball
{
  PVector location,acceleration,mouse;
  ball()
  {
    location = new PVector(width/2,height/2);
    acceleration = new PVector(2,0);
  }
  void update()
  {
    mouse = new PVector(mouseX,mouseY);
    mouse.sub(location);
    mouse.normalize();
    mouse.mult(5);
    location.add(mouse);
  }
  void display()
  {
    background(50);
    noFill();
    update();
    for(int i = 0;i < 20; ++i)
    {
      int r = (int)random(100);
      stroke(random(255),random(255),random(255));
      ellipse(location.x + random(10) - 5,location.y + random(10) - 5,r,r);
    }
  }
}