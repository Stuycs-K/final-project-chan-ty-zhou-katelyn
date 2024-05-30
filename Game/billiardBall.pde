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
    velocity = new PVector(0, 0);
  }
  
  void move(){
    velocity.add(velocity.x / -150, velocity.y / -150);
    velocity.add(acceleration);
    position.add(velocity);
    if(velocity.mag() < 0.2){
      velocity = new PVector(0, 0);
    }
    acceleration = new PVector(0, 0);
  }
  
  void display(){
    stroke(0);
    strokeWeight(1);
    fill(c);
    circle(this.position.x, this.position.y, radius * 2);
    if(stripes){
      noStroke();
      fill(255);
      rect(this.position.x - radius + 1, this.position.y - 3.5, radius * 2 -1, 7);
    }
    noStroke();
  }
  
  void applyForce(PVector force){
    acceleration.add(PVector.div(force, this.mass));
  }
  
  void ballCollide(billiardBall other){
    PVector force = PVector.sub(other.position, this.position);
    force.normalize();
    force.rotate((float)(Math.random() * (PI / 18) - (PI / 36)));
    force.mult(velocity.mag() * mass * sq(cos(PVector.angleBetween(force, this.velocity))));
    other.applyForce(force);
    this.applyForce(PVector.mult(force, -1));
  }
  
  void wallCollide(){
    if(position.x >= 1122 && (position.y >= 185 && position.y <= 615)){
      position.x -= 3;
      velocity.x *= -1;
    }
    else if(position.x <= 178 && (position.y >= 185 && position.y <= 615)){
      position.x += 3;
      velocity.x *= -1;
    }
    if(position.y >= 622 && ((position.x >= 190 && position.x <= 615)||(position.x >= 685 && position.x <= 1110))){
      position.y -= 3;
      velocity.y *= -1;
    }
    else if(position.y <= 178 && ((position.x >= 190 && position.x <= 615)||(position.x >= 685 && position.x <= 1110))){
      position.y += 3;
      velocity.y *= -1;
    }
  }
}
