public class cueStick{
  PVector direction;
  double xPos, yPos;
  
  public cueStick(double x, double y){
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
  
  void changeDir(double x, double y){}
  
  void changePos(double x, double y){}
  
  void display(){}
}
