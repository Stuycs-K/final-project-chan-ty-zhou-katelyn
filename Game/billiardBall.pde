public class billiardBall{
  float radius, mass;
  PVector velocity, acceleration, position;
  boolean stripes;
  color c;
  
  public billiardBall(float r, float m, boolean stripe, color Color, float xPos, float yPos){
    mass = m;
    radius = r;
    stripes = stripe;
    c = Color;
    position = new PVector(xPos, yPos);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }
  
  void move(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration = new PVector(0, 0);
  }
  
  void display(){
    noStroke();
    fill(c);
    circle(this.position.x, this.position.y, radius * 2);
  }
  
  void applyForce(PVector force){
    acceleration.sub(PVector.div(force, this.mass));
  }
}
