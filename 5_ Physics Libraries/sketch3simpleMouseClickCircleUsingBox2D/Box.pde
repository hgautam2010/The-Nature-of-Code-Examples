class box
{
  float x, y;
  Vec2 v;
  Body body;
  
  box(float x, float y)
  {
    this.x = x;
    this.y = y;
    v = new Vec2(0,0);
    
    //Step 1: Define Body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    
    //Step 2: Create Body
    body = box2d.createBody(bd);
    
    //Step 3: Create Shape
    CircleShape ps = new CircleShape();
    float circleRadius = box2d.scalarPixelsToWorld(16/2);
    ps.m_radius = circleRadius;
    
    //Step 4: Create Fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    //Parameters that affect physics
    fd.density = 0.1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    //Ste 5: Attach Shape to Bode with Fixture
    body.createFixture(fd);
  }
  void display()
  {
    v = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(v.x,v.y);
    rotate(-a);
    stroke(0);
    strokeWeight(3);
    fill(100);
    ellipse(0, 0, 16, 16);
    line(0,0,5,5);
    popMatrix();
  }
}