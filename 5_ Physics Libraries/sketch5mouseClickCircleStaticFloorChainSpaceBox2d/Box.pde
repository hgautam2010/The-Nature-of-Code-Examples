class box
{
  float x, y, r;
  Vec2 v;
  Body body;
  
  box(float x, float y)
  {
    v = new Vec2(0,0);
    
    //Step 1: Define Body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    
    //Step 2: Create Body
    body = box2d.world.createBody(bd);
    
    //Step 3: Create Shape
    CircleShape ps = new CircleShape();
    r = random(20,30);
    float circleRadius = box2d.scalarPixelsToWorld(r/2);
    ps.m_radius = circleRadius;
    
    //Step 4: Create Fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    
    //Parameters that affect physics
    fd.density = 0.1;
    fd.friction = 0.01;
    fd.restitution = 0.5;
    
    //Ste 5: Attach Shape to Bode with Fixture
    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(-10f,10f),random(5f,10f)));
    body.setAngularVelocity(random(-10,10));
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
    ellipse(0, 0, r, r);
    line(0,0,r/3,r/3);
    popMatrix();
  }
}