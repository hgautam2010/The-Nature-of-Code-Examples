float inc, zoff;
int scale, rows, cols, pSize;
ArrayList<particle> p;
PVector flowField[];
PImage pic;
int[][] A;
boolean go;
void setup()
{
  size(560, 759, P2D);
  background(255);
  pic = loadImage("pic2.png");
  pic.loadPixels();
  scale = 1;
  inc = 0.1;
  zoff = 0;
  pSize = 5000;
  rows = floor(height/scale);
  cols = floor(width/scale);
  p = new ArrayList<particle>();
  for (int i = 0; i < pSize; i++)
    p.add(new particle());
  flowField = new PVector[cols*rows];
  for(int i = 0; i < cols*rows; ++i)
    flowField[i] = new PVector(0,0);
  A = new int[8][2];
  setupA();
  setupFlowField();
  go = true;
}
void draw()
{
  //background(255);
  if(go)
  for (particle p : p)
  {
    p.follow(flowField);
    p.display();
    //println(go + "" + frameCount);
  }
  //if(go)
  //  saveFrame("output/pic_#####.png");
  //println(go + "" + frameCount);
}
void setupFlowField()
{
  for (int y = 1; y < rows - 1; ++y)
  {
    for (int x = 1; x < cols - 1; ++x)
    {
      int index = x + y * cols; 
      PVector mx = maxx(x, y);
      PVector v = new PVector(x, y);
      v.sub(mx);
      v.setMag(0.5);
      flowField[index] = v;
      //fill(angle);
      //stroke(1);
      //rect(x*scale, y*scale, scale, scale);
      //pushMatrix();
      //translate(x*scale, y*scale);
      //rotate(v.heading());
      //line(0, 0, scale, 0);
      //popMatrix();
    }
  }
}
PVector maxx(int x, int y)
{
  float mx = brightness(pic.get(x, y));
  float a, b;
  a = x;
  b = y;
  for (int i = 0; i < 8; ++i)
  {
    if (brightness(pic.get(x + A[i][0], y+A[i][1])) > mx)
    {
      mx = brightness(pic.get(x + A[i][0], y+A[i][1]));
      a = x + A[i][0];
      b = y + A[i][1];
    }
  }
  return new PVector(a, b);
}
void setupA()
{
  A[0][0] = -1;
  A[1][0] = -1;
  A[2][0] = -1;
  A[3][0] = 0;
  A[4][0] = 0;
  A[5][0] = 1;
  A[6][0] = 1;
  A[7][0] = 1;
  A[0][1] = -1;
  A[1][1] = 0;
  A[2][1] = 1;
  A[3][1] = -1;
  A[4][1] = 1;
  A[5][1] = -1;
  A[6][1] = 0;
  A[7][1] = 1;
}
void keyPressed()
{
  if(key == 'r' || key == 'R')
    go = !go;
}