public class billiardBall{
  float radius, mass;
  PVector velocity, acceleration, position, spin;
  boolean stripes;
  color c;
  int num;
  int count;
  
  public billiardBall(float r, float m, boolean stripe, color Color, float xPos, float yPos, int n){
    mass = m;
    radius = r;
    stripes = stripe;
    c = Color;
    position = new PVector(xPos, yPos);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    num = n;
    spin = new PVector(0,0);
  }
  
    public billiardBall(float r, float m, color Color, float xPos, float yPos, int n){
    mass = m;
    radius = r;
    c = Color;
    position = new PVector(xPos, yPos);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    num = n;
    spin = new PVector(0,0);
    count = 0;
  }
  
  void move(){
    velocity.add(velocity.x / -150, velocity.y / -150);
    velocity.add(acceleration);
    if(num == 0 && velocity.mag() > 1){
      velocity.add(PVector.div(spin, 50 * velocity.mag() * sqrt((count + 1))));
    }
    spin.add(spin.x / -120, spin.y / -120);
    if(spin.mag() < 0.1){
        spin = new PVector(0,0);
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
  
  void ballCollide(billiardBall other, int div, PVector vel){
    PVector force = PVector.sub(other.position, this.position);
    force.normalize();
    force.rotate((float)(Math.random() * (PI / 18) - (PI / 36)));
    force.mult(vel.mag() * mass / 1.1 * sq(cos(PVector.angleBetween(force, vel))) / div);
    other.applyForce(force);
    this.applyForce(PVector.mult(force, -1));
  }
  
  void wallCollide(){
    if(position.x >= 1132 || (position.x >= 1122 && (position.y >= 185 && position.y <= 615))){
      position.x -= 2;
      velocity.x *= -1;
      if(spin.mag() < 15){
  spin.mult(-10);
}
    }
    else if(position.x <= 168 ||(position.x <= 178 && (position.y >= 185 && position.y <= 615))){
      position.x += 2;
      velocity.x *= -1;
      if(spin.mag() < 15){
  spin.mult(-10);
}
    }
    if(((position.y >= 632)) || (position.y >= 622 && ((position.x >= 190 && position.x <= 615)||(position.x >= 685 && position.x <= 1110)))){
      position.y -= 2;
      velocity.y *= -1;
      if(spin.mag() < 15){
  spin.mult(-10);
}
    }
    else if(((position.y <= 168)) || (position.y <= 178 && ((position.x >= 190 && position.x <= 615)||(position.x >= 685 && position.x <= 1110)))){
      position.y += 2;
      velocity.y *= -1;
      if(spin.mag() < 15){
  spin.mult(-10);
}
    }
  }
}
