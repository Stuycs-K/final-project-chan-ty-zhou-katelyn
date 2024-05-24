public class cueStick{
  PVector direction;
  float xPos, yPos;

  public cueStick(float x, float y){
    direction = new PVector(0, 0);
    xPos = x;
    yPos = y;
  }

  void applyHit(billiardBall ball){
    ball.applyForce(direction);
  }

  void adjustPower(float power){
    direction = direction.normalize().mult(power);
  }

  void changeDir(float x, float y){
    direction = PVector.mult(new PVector(x - mouseX, y - mouseY), direction.mag());
  }

  void changePos(float x, float y){
    xPos = x;
    yPos = y;
  }

  void display(){
    strokeWeight(16);
    line(xPos, yPos, xPos - direction.x, yPos - direction.y);
  }
}
