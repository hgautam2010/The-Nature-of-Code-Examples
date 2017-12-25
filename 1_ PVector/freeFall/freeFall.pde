//Simulate freefall of a ball
ball b;
boolean go;
int i;
void setup()
{
  b = new ball();
  //for(i = 0; i < 50; ++i)
    //b[i] = new ball();
  size(640,320);
  go = true;
}
void draw()
{
  if(go)
  {
    //for(i = 0; i < 50; ++i)
    //{
      b.display();
      //check(b);
    //}
  }
}
void check(ball b)
{
  if(b.check())
    go = false;
}