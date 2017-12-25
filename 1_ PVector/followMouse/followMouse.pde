//In this sketch set of random circles follow the mouse location
ball b;
void setup()
{
  size(1080,720);
  b = new ball();
}
void draw()
{
  b.display();
}