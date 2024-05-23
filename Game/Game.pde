ArrayList<billiardBall> ballList;
cueStick stick;
static int backColor = 255;

void setup(){
  size(1300, 800);
  stick = new cueStick(0, 0);
  ballList = new ArrayList<billiardBall>();
  /*for(int x = 0; x < 16 * 50; x+= 50){
    ballList.add(new billiardBall(15, 25, true, 0, x, height/2));
  }*/
  ballList.add(new billiardBall(20, 25, true, 158, 500, height/2, -3, 0));
  ballList.add(new billiardBall(20, 25, true, 0, 300, height/2, 3, 0));
}

void draw(){
  background(backColor);
  fill(190);
  rect(100, 100, 1100, 600);
  for(billiardBall ball : ballList){
    ball.move();
    ball.display();
    ball.wallCollide();
    
  }
}
