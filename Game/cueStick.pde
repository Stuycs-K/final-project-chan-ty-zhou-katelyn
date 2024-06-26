public class cueStick{
  PVector direction;
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
    direction = direction.normalize().mult(power * 5);
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
    fill(#c98165);
    strokeWeight(12);
    float xVal = 250 * cos(direction.heading());
    float yVal = 250 * sin(direction.heading());
    stroke(#a86b53);
    line(xPos - xVal/7, yPos - yVal/7, xPos - xVal, yPos - yVal);
    stroke(0);
    line(xPos - xVal, yPos - yVal, xPos - xVal * 1.5, yPos - yVal * 1.5);
    stroke(255);
    strokeCap(SQUARE);
    line(xPos - xVal/10, yPos - yVal/10, xPos - xVal/8, yPos - yVal/8);
    strokeCap(ROUND);
    strokeWeight(2);
    line(xPos, yPos, xPos + direction.x * 3, yPos + direction.y * 3);
  }
}
