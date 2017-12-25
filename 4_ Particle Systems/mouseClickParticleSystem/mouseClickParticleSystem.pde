ArrayList<particleSystem> system;
void setup()
{
  size(1080, 720, P2D);
  system = new ArrayList<particleSystem>();
}
void draw()
{
  background(100);
  for (int i = system.size() - 1; i >= 0; --i)
  {
    particleSystem p = system.get(i);
    p.display();
  }
  if (mousePressed)
  {
    system.add(new particleSystem(mouseX, mouseY));
  }
  println(system.size());
}