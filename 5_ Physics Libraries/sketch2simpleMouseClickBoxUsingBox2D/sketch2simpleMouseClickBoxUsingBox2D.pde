import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<box> A;
Box2DProcessing box2d;

void setup()
{
  size(720,360);
  A = new ArrayList<box>();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  //Create array list
  A = new ArrayList<box>();
}
void draw()
{
  background(200);
  box2d.step();
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