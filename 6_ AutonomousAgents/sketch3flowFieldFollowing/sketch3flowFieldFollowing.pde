float inc, zoff;
int scale, rows, cols, pSize;
ArrayList<particle> p;
PVector flowField[];
boolean go;
void setup()
{
  size(1280,820,P2D);
  background(255);
  scale = 30;
  inc = 0.1;
  zoff = 0;
  pSize = 5000;
  rows = floor(width/scale);
  cols = floor(height/scale);
  p = new ArrayList<particle>();
  for (int i = 0; i < pSize; i++)
    p.add(new particle());
  flowField = new PVector[cols*rows];
  go = false;
}
void draw()
{
  //background(255);
  float yoff = 0;
  for (int y = 0; y < rows; ++y)
  {
    float xoff = 0;
    for (int x = 0; x < cols; ++x)
    {
      int index = x + y * cols; 
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 3;
      PVector v = PVector.fromAngle(angle);
      v.setMag(0.5);
      flowField[index] = v;
      
      fill(angle);
      stroke(1);
      
      //rect(x*scale, y*scale, scale, scale);

      //pushMatrix();
      //translate(x*scale, y*scale);
      //rotate(v.heading());
      //line(0, 0, scale, 0);
      //popMatrix();
      
      xoff += inc;
    }
    yoff += inc;
  }
  zoff += 0.01;
  
  for (particle p : p)
  {
    p.follow(flowField);
    p.display();
  }
  if(go)
    saveFrame("output/pic_#####.png");
  println(go + "" + frameCount);
}
void keyPressed()
{
  if(key == 'r' || key == 'R')
    go = !go;
}