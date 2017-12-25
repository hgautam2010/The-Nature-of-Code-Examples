class floor
{
  Vec2 v;
  Body body;
  PVector loc,dim;
  floor(PVector loc, PVector dim)
  {
    v = new Vec2(0,0);
    this.loc = new PVector(loc.x, loc.y);
    this.dim = new PVector(dim.x, dim.y);
    //Step 1: Define Body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(loc.x,loc.y));
    
    //Step 2: Create Body
    body = box2d.createBody(bd);
    
    //Step 3: Create Shape
    PolygonShape ps = new PolygonShape();
    float box2Dh = box2d.scalarPixelsToWorld(dim.x/2);
    float box2Dw = box2d.scalarPixelsToWorld(dim.y/2);
    ps.setAsBox(box2Dh,box2Dw);
    
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
    pushMatrix();
    translate(v.x,v.y);
    stroke(0);
    strokeWeight(3);
    fill(100);
    rectMode(CENTER);
    rect(0, 0, dim.x, dim.y);
    popMatrix();
  }
}