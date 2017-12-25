class surface
{
  Vec2 v;
  Body body;
  ArrayList<Vec2> points;
  surface()
  {
    points = new ArrayList<Vec2>();
    //points.add(new Vec2(0, height/2));
    //points.add(new Vec2(width/2, height/2+50));
    //points.add(new Vec2(width, height/2));
    
    for(float i = 0; i < width; ++i)
    {
      points.add(new Vec2(i, map(noise(i/100),0,1,400,720)));
      //points.add(new Vec2(i, map(sin(i/100),-1,1,400,720)));
    }

    ChainShape chain = new ChainShape();

    Vec2[] vertices = new Vec2[points.size()];
    for (int i = 0; i < vertices.length; ++i)
    {
      vertices[i] = box2d.coordPixelsToWorld(points.get(i));
    }

    chain.createChain(vertices, vertices.length);

    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);

    //Ste 5: Attach Shape to Bode with Fixture
    body.createFixture(chain, 1);
  }
  void display()
  {
    stroke(0);
    strokeWeight(3);
    fill(100);
    beginShape();
    {
      for (Vec2 v : points)
      {
        vertex(v.x, v.y);
      }
      vertex(width, height);
      vertex(0, height);
    }
    endShape();
  }
}