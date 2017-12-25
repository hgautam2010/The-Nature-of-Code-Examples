import java.util.*;
float x;
float t1,t2;
void setup()
{
  size(1080,720);
  t1 = (int)random(10);
  t2 = (int)random(10);
  frameRate(20);
}
void draw()
{
  //background(255);
  fill(0);
  t1 += 0.01;t2 += 0.01;  
  noStroke();
  ellipse(map(noise(t1),0,1,0,width),map(noise(t2),0,1,0,height),5,5);
}