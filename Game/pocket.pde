public class pocket{
  float radius, xPos, yPos;
  
  public pocket(float r, float x, float y){
    radius = r;
    xPos = x;
    yPos = y;
  }
  
  boolean detectGoal(double x, double y){
    return false;
  }
  
  void display(){
    noStroke();
    fill(0);
    circle(xPos, yPos, radius * 2);
  }
}
