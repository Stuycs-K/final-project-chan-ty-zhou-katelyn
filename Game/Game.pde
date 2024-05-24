ArrayList<billiardBall> ballList;
ArrayList<pocket> pocketList;
cueStick stick;
static int backColor = 255;

void setup(){
  background(#0AB086); //832222 brown
  size(1300, 800);
  stick = new cueStick(0, 0);
  ballList = new ArrayList<billiardBall>();
  pocketList = new ArrayList<pocket>();
  ballList.add(new billiardBall(15, 25, 255, 250, 400)); //cueBall
  ballList.add(new billiardBall(15, 25, true, #FFFF00, 800, 400)); //row1 ;; yellow striped
  ballList.add(new billiardBall(15, 25, true, #FFA500, 830, 420)); //row2 ;; orange striped
  ballList.add(new billiardBall(15, 25, false, #FFA500, 830, 380)); //orange solid
  ballList.add(new billiardBall(15, 25, false, #FF0000, 860, 440)); //row3 ;; red solid 
  ballList.add(new billiardBall(15, 25, false, #460000, 860, 360)); //dark red solid
  ballList.add(new billiardBall(15, 25, false, #0000FF, 890, 340)); //row4 ;; blue solid 
  ballList.add(new billiardBall(15, 25, false, #800080, 890, 380)); //purple solid
  ballList.add(new billiardBall(15, 25, true, #FF0000, 890, 420)); //red striped
  ballList.add(new billiardBall(15, 25, false, #FFFF00, 890, 460)); //yellow solid
  ballList.add(new billiardBall(15, 25, true, #0000FF, 920, 320)); //row5 ;; blue striped
  ballList.add(new billiardBall(15, 25, true, #00FF00, 920, 360)); //green striped
  ballList.add(new billiardBall(15, 25, false, #00FF00, 920, 400)); //green solid
  ballList.add(new billiardBall(15, 25, true, #460000, 920, 440)); //dark red striped
  ballList.add(new billiardBall(15, 25, true, #800080, 920, 480)); //purple striped
  ballList.add(new billiardBall(15, 25, 0, 860, 400)); //8ball
  
  pocketList.add(new pocket(20, 125, 125));
  pocketList.add(new pocket(20, 650, 125));
  pocketList.add(new pocket(20, 1175, 125));
  pocketList.add(new pocket(20, 125, 675));
  pocketList.add(new pocket(20, 650, 675));
  pocketList.add(new pocket(20, 1175, 675));
}

void draw(){
  background(backColor);
  fill(#964B00);
  rect(100, 100, 1100, 600);
  fill(0, 255, 0);
  rect(150, 150, 1000, 500);
  for(pocket pocket : pocketList){
    pocket.display();
  }
  for(billiardBall ball : ballList){
    ball.move();
    ball.display();
    ball.wallCollide();

  }
  stick.changePos(ballList.get(0).position.x, ballList.get(0).position.y);
  stick.display();
}

void mouseClicked(){
 // stick.changeDir();
}
