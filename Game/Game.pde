ArrayList<billiardBall> ballList;
cueStick stick;

void setup(){
  background(#0AB086); //832222 brown
  size(1300, 800);
  stick = new cueStick(0, 0);
  ballList = new ArrayList<billiardBall>();
  ballList.add(new billiardBall(15, 25, 255, 250, 400)); //cueBall
  ballList.add(new billiardBall(15, 25, true, 0, 800, 400)); //row1
  ballList.add(new billiardBall(15, 25, true, 0, 830, 420)); //row2
  ballList.add(new billiardBall(15, 25, true, 0, 830, 380)); 
  ballList.add(new billiardBall(15, 25, true, 0, 860, 440)); //row3
  ballList.add(new billiardBall(15, 25, true, 0, 860, 360));
  ballList.add(new billiardBall(15, 25, true, 0, 890, 340)); //row4
  ballList.add(new billiardBall(15, 25, true, 0, 890, 380));
  ballList.add(new billiardBall(15, 25, true, 0, 890, 420));
  ballList.add(new billiardBall(15, 25, true, 0, 890, 460));
  ballList.add(new billiardBall(15, 25, true, 0, 920, 320)); //row5
  ballList.add(new billiardBall(15, 25, true, 0, 920, 360));
  ballList.add(new billiardBall(15, 25, true, 0, 920, 400));
  ballList.add(new billiardBall(15, 25, true, 0, 920, 440));
  ballList.add(new billiardBall(15, 25, true, 0, 920, 480));
  ballList.add(new billiardBall(15, 25, 0, 860, 400)); //8ball
}

void draw(){
  for(billiardBall ball : ballList){
    ball.display();
  }
}
