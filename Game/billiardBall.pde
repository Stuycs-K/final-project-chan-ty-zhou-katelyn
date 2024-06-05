public class billiardBall{
  float radius, mass;
  PVector velocity, acceleration, position, sideSpin;
  boolean stripes;
  color c;
  int num;
  
  public billiardBall(float r, float m, boolean stripe, color Color, float xPos, float yPos, int n){
    mass = m;
    radius = r;
    stripes = stripe;
    c = Color;
    position = new PVector(xPos, yPos);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    num = n;
    sideSpin = new PVector(0,0);
  }
  
    public billiardBall(float r, float m, color Color, float xPos, float yPos, int n){
    mass = m;
    radius = r;
    c = Color;
    position = new PVector(xPos, yPos);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    num = n;
    sideSpin = new PVector(0,0);
    sideSpin = PVector.div(velocity,300);
  }
  
  void move(){
    velocity.add(velocity.x / -150, velocity.y / -150);
    velocity.add(acceleration);
    if(num==0){
      //sideSpin = PVector.div(velocity,300);
      sideSpin.rotate(HALF_PI);
      velocity.add(sideSpin);
      if(sideSpin.mag() < 50){
        sideSpin = new PVector(0,0);
      }
    }
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
    textSize(10);
    textAlign(CENTER);
    fill(255);
    strokeWeight(0);
    if(num!=0){
      circle(this.position.x, this.position.y, radius);
    }
    fill(0);
    if(num!=0){
      text(""+num, position.x-1, position.y+3);
    }
    noStroke();
    textAlign(LEFT);
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
    if(position.x >= 1132 || (position.x >= 1122 && (position.y >= 185 && position.y <= 615))){
      position.x -= 2;
      velocity.x *= -1;
      //if(sideSpin.mag()>0){
        sideSpin.mult(500);
      //}
    }
    else if(position.x <= 168 ||(position.x <= 178 && (position.y >= 185 && position.y <= 615))){
      position.x += 2;
      velocity.x *= -1;
      //if(sideSpin.mag()>0){
        sideSpin.mult(500);
      //}
    }
    if(((position.y >= 632)) || (position.y >= 622 && ((position.x >= 190 && position.x <= 615)||(position.x >= 685 && position.x <= 1110)))){
      position.y -= 2;
      velocity.y *= -1;
      //if(sideSpin.mag()>0){
        sideSpin.mult(500);
      //}
    }
    else if(((position.y <= 168)) || (position.y <= 178 && ((position.x >= 190 && position.x <= 615)||(position.x >= 685 && position.x <= 1110)))){
      position.y += 2;
      velocity.y *= -1;
      //if(sideSpin.mag()>0){
        sideSpin.mult(500);
      //}
    }
  }
}
