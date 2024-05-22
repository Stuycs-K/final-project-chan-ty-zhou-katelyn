ArrayList<billiardBall> ballList;
cueStick stick;

void setup(){
  size(1300, 800);
  stick = new cueStick(0, 0);
  ballList = new ArrayList<billiardBall>();
  for(int x = 0; x < 16 * 50; x+= 50){
    ballList.add(new billiardBall(15, 25, true, 0, x, height/2));
  }
}

void draw(){
  for(billiardBall ball : ballList){
    ball.display();
  }
}
