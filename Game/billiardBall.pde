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
  
    public billiardBall(float r, float m, color Color, float xPos, float yPos){
    mass = m;
    radius = r;
    c = Color;
    position = new PVector(xPos, yPos);
    acceleration = new PVector(0, 0);
    velocity = new PVector(20, 0.25);
  }
  
  void move(){
    velocity.add(velocity.x / -150, velocity.y / -150);
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
    acceleration.add(PVector.div(force, this.mass));
  }
  
  void ballCollide(billiardBall other){
    PVector force = PVector.sub(other.position, this.position);
    force.normalize();
    force.mult(velocity.mag() * 10 * sq(cos(PVector.angleBetween(force, this.velocity))));
    other.applyForce(force);
    this.applyForce(PVector.mult(force, -1));
  }
  
  void wallCollide(){
    if(position.x >= 1135 || position.x <= 165){
      velocity.x *= -1;
    }
    if(position.y >= 635 || position.y <= 165){
      velocity.y *= -1;
    }
  }
}
