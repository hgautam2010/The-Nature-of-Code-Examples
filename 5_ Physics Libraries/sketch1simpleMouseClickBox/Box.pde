class box
{
  float x, y;
  box(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  void display()
  {
    stroke(0);
    strokeWeight(3);
    rectMode(CENTER);
    fill(100);
    rect(x, y, 20, 20);
  }
}