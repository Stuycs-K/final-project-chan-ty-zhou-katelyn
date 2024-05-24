public class pocket{
  float radius, xPos, yPos;
  
  public pocket(float r, float x, float y){
    radius = r;
    xPos = x;
    yPos = y;
  }
  
  boolean detectGoal(float x, float y){
    if(abs(xPos-x) <= radius && abs(yPos-y) <= radius){
    return true;
  }
    return false;
  }
  
  void display(){
    noStroke();
    fill(0);
    circle(xPos, yPos, radius * 2);
  }
}
