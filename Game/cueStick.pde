public class cueStick{
  PVector direction;
  PVector cueForce;
  float xPos, yPos;

  public cueStick(float x, float y){
    direction = new PVector(1, 0);
    direction.mult(50);
    xPos = x;
    yPos = y;
  }

  void applyHit(billiardBall ball){
    ball.applyForce(direction);
  }

  void adjustPower(float power){
    direction = direction.normalize().mult(power);
  }

  void changeDir(PVector cuePos){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector tempVec = PVector.sub(cuePos, mouse);
    direction = tempVec.normalize().mult(direction.mag());
  }

  void changePos(float x, float y){
    xPos = x;
    yPos = y;
  }

  void display(){
    strokeWeight(20);
    stroke(0);
    line(xPos, yPos, xPos - direction.x, yPos - direction.y);
    strokeWeight(5);
  }
}
