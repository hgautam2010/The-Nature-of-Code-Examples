ArrayList<box> A;
void setup()
{
  size(720,360);
  A = new ArrayList<box>();
}
void draw()
{
  background(200);
  for(int i = A.size() - 1; i >= 0; --i)
  {
    box p = A.get(i);
    p.display();
  }
  if(mousePressed)
  {
    A.add(new box(mouseX,mouseY));
  }
}