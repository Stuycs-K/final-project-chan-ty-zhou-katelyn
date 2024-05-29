public class board{
  ArrayList<billiardBall> ballList;
  ArrayList<pocket> pocketList;
  
  public board(){
    ballList = new ArrayList<billiardBall>();
    pocketList = new ArrayList<pocket>();
    ballList.add(new billiardBall(15, 25, 255, 250, 400)); //cueBall
    ballList.add(new billiardBall(15, 25, color(0), 860, 400)); //8ball
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
    pocketList.add(new pocket(20, 135, 135));
    pocketList.add(new pocket(20, 650, 130));
    pocketList.add(new pocket(20, 1165, 135));
    pocketList.add(new pocket(20, 135, 665));
    pocketList.add(new pocket(20, 650, 670));
    pocketList.add(new pocket(20, 1165, 665));
  }

  void display(){
    fill(#691d10);
    rect(100, 100, 1100, 600);
    fill(#0a7f71);
    rect(150, 150, 1000, 500);
    fill(#86d3f2);
    rect(35, 150, 45, 500);
    rect(525, 725, 260, 59);
    for(pocket pocket : pocketList){
      pocket.display();
    }
    for(billiardBall ball : ballList){
      ball.move();
      ball.display();
      ball.wallCollide();
      for(billiardBall other : ballList){
        if(ball != other && dist(ball.position.x, ball.position.y, other.position.x, other.position.y) < 30){
          ball.ballCollide(other);
        }
      }
    }
  }
}
