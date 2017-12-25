//This program change ackground color randomly with noise function 
float t1,t2,t3;
void setup()
{
  size(1080,720);
  t1 = (int)random(0,255);
  t2 = (int)random(0,255);
  t3 = (int)random(0,255);
  frameRate(20);
}
void draw()
{
  background(map(noise(t1),0,1,0,255),map(noise(t2),0,1,0,255),map(noise(t3),0,1,0,255));
  t1 += 0.01;t2 += 0.01; t3 += 0.01;
}