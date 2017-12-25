import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<box> A;
surface f;
Box2DProcessing box2d;

void setup()
{
  size(1080,720);
  A = new ArrayList<box>();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  
  //Create array list
  A = new ArrayList<box>();
  f = new surface();
}
void draw()
{
  background(200);
  box2d.step();
  f.display();
  for(int i = A.size() - 1; i >= 0; --i)
  {
    box p = A.get(i);
    p.display();
    if(p.v.y != 0 && p.v.y > height)
      A.remove(i);
  }
  if(mousePressed)
  {
    A.add(new box(mouseX - random(0,1),mouseY - random(0,1)));
  }
  //println(A.size());
}