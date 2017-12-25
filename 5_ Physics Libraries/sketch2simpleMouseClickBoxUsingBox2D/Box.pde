class box
{
  float x, y;
  
  Body body;
  
  box(float x, float y)
  {
    this.x = x;
    this.y = y;
    
    //Step 1: Define Body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    
    //Step 2: Create Body
    body = box2d.createBody(bd);
    
    //Step 3: Create Shape
    PolygonShape ps = new PolygonShape();
    float box2Dw = box2d.scalarPixelsToWorld(16/2);
    float box2Dh = box2d.scalarPixelsToWorld(16/2);
    ps.setAsBox(box2Dw,box2Dh);
    
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
    Vec2 v = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(v.x,v.y);
    rotate(-a);
    stroke(0);
    strokeWeight(3);
    rectMode(CENTER);
    fill(100);
    rect(0, 0, 20, 20);
    popMatrix();
  }
}