public class board{
  ArrayList<billiardBall> ballList;
  ArrayList<pocket> pocketList;
  int countStripe = 0;
  int countSolid = 0;
  
  public board(){
    ballList = new ArrayList<billiardBall>();
    pocketList = new ArrayList<pocket>();
    ballList.add(new billiardBall(18, 25, 255, 250, 400)); //cueBall
    ballList.add(new billiardBall(18, 25, color(0), 860, 400)); //8ball
    ballList.add(new billiardBall(18, 25, true, #FFFF00, 800, 400)); //row1 ;; yellow striped
    ballList.add(new billiardBall(18, 25, true, #FFA500, 830, 420)); //row2 ;; orange striped
    ballList.add(new billiardBall(18, 25, false, #FFA500, 830, 380)); //orange solid
    ballList.add(new billiardBall(18, 25, false, #FF0000, 860, 440)); //row3 ;; red solid 
    ballList.add(new billiardBall(18, 25, false, #460000, 860, 360)); //dark red solid
    ballList.add(new billiardBall(18, 25, false, #0000FF, 890, 340)); //row4 ;; blue solid 
    ballList.add(new billiardBall(18, 25, false, #800080, 890, 380)); //purple solid
    ballList.add(new billiardBall(18, 25, true, #FF0000, 890, 420)); //red striped
    ballList.add(new billiardBall(18, 25, false, #FFFF00, 890, 460)); //yellow solid
    ballList.add(new billiardBall(18, 25, true, #0000FF, 920, 320)); //row5 ;; blue striped
    ballList.add(new billiardBall(18, 25, true, #00FF00, 920, 360)); //green striped
    ballList.add(new billiardBall(18, 25, false, #00FF00, 920, 400)); //green solid
    ballList.add(new billiardBall(18, 25, true, #460000, 920, 440)); //dark red striped
    ballList.add(new billiardBall(18, 25, true, #800080, 920, 480)); //purple striped

    pocketList.add(new pocket(25, 150, 145));
    pocketList.add(new pocket(25, 650, 140));
    pocketList.add(new pocket(25, 1145, 145));
    pocketList.add(new pocket(25, 150, 655));
    pocketList.add(new pocket(25, 650, 660));
    pocketList.add(new pocket(25, 1145, 655));
  }

  void display(){
    strokeWeight(5);
    stroke(0);
    fill(#6c3026);
    rect(110, 110, 1080, 580);
    fill(#0a7f71);
    strokeWeight(0);
    rect(150, 150, 1000, 500);
    strokeWeight(2);
    rect(35, 150, 45, 500);
    fill(255);
    rect(525, 725, 260, 59);
    strokeWeight(0);
    fill(#00FF00);
    rect(35, 150, 45, 169);
    fill(#FFFF00);
    rect(35, 319, 45, 169);
    fill(#FF0000);
    rect(35, 488, 45, 165);
    textSize(25);
    fill(0);
    text("low", 40, 140);
    text("high", 35, 675);
    text("shoot!", 620, 765);
    fill(#076156);
    quad(180, 150, 625, 150, 615, 160, 190, 160);
    quad(180, 650, 625, 650, 615, 640, 190, 640);
    quad(675, 150, 1120, 150, 1110, 160, 685, 160);
    quad(675, 650, 1120, 650, 1110, 640, 685, 640);
    quad(150, 175, 150, 625, 160, 615, 160, 185);
    quad(1150, 175, 1150, 625, 1140, 615, 1140, 185);
    for(pocket pocket : pocketList){
      pocket.display();
    }
    for(billiardBall ball : ballList){
      ball.move();
      ball.display();
      ball.wallCollide();
      for(billiardBall other : ballList){
        if(ball != other && dist(ball.position.x, ball.position.y, other.position.x, other.position.y) < 36){
          ball.ballCollide(other);
        }
      }
    }
    for(pocket pocket : pocketList){
      for(int i = 2; i < ballList.size(); i++){
        if(pocket.detectGoal(ballList.get(i).position.x,ballList.get(i).position.y)){
          ballList.remove(i);
          i--;
        }
    }
    }
  }
}
