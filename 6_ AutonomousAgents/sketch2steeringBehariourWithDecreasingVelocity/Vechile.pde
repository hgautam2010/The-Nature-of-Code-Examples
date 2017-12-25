class vechile
{
  PVector loc, vel, acc;
  float r, maxSpeed, maxForce;
  vechile(PVector loc)
  {
    this.loc = loc;
    vel = new PVector(0, -2);
    acc = new PVector(0, 0);
    r = 6;
    maxSpeed = 4;
    maxForce = 0.1;
  }
  void update()
  {
    vel.add(acc);
    vel.limit(maxSpeed);
    loc.add(vel);
    acc.mult(0);
  }
  void applyForce(PVector f)
  {
    acc.add(f);
  }
  void seek(PVector target)
  {
    PVector desire = PVector.sub(target, loc);
    float d = desire.mag();
    if (d > 100)
      desire.setMag(maxSpeed);
    else
    {
      desire.setMag(map(d, 0, 100, 0, maxSpeed));
    }
    PVector steer = PVector.sub(desire, vel);
    steer.limit(maxForce);
    applyForce(steer);
  }
  void display()
  {
    float theta = vel.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}