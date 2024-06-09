public class board{
  ArrayList<billiardBall> ballList;
  ArrayList<billiardBall> stripeIn;
  ArrayList<billiardBall> solidIn;
  ArrayList<pocket> pocketList;
  boolean whiteIn = false;
  boolean blackIn = false;
  boolean movement;
  boolean cheatMode = false;
  int stripe;
  int solid;
  int tempStripe;
  int tempSolid;
  int count;
  PVector spinAngle;
  
  public board(){
    ballList = new ArrayList<billiardBall>();
    pocketList = new ArrayList<pocket>();
    stripeIn = new ArrayList<billiardBall>();
    solidIn = new ArrayList<billiardBall>();
    stripe = 7;
    solid = 7;
    tempStripe = 0;
    tempSolid = 0;
    count =0;
    spinAngle = new PVector(0, 0);
    billiardBall cueBall = new billiardBall(17, 25, 255, 250, 400, 0);
    ballList.add(cueBall); //cueBall
    ballList.add(new billiardBall(17, 25, color(0), 860, 400, 8)); //8ball
    ballList.add(new billiardBall(17, 25, true, #FFFF00, 800, 400, 1)); //row1 ;; yellow striped
    ballList.add(new billiardBall(17, 25, true, #FFA500, 830, 420, 2)); //row2 ;; orange striped
    ballList.add(new billiardBall(17, 25, false, #FFA500, 830, 380, 9)); //orange solid
    ballList.add(new billiardBall(17, 25, false, #FF0000, 860, 440, 10)); //row3 ;; red solid 
    ballList.add(new billiardBall(17, 25, false, #8B0000, 860, 360, 11)); //dark red solid
    ballList.add(new billiardBall(17, 25, false, #0000FF, 890, 340, 12)); //row4 ;; blue solid 
    ballList.add(new billiardBall(17, 25, false, #800080, 890, 380, 13)); //purple solid
    ballList.add(new billiardBall(17, 25, true, #FF0000, 890, 420, 3)); //red striped
    ballList.add(new billiardBall(17, 25, false, #FFFF00, 890, 460, 14)); //yellow solid
    ballList.add(new billiardBall(17, 25, true, #0000FF, 920, 320, 4)); //row5 ;; blue striped
    ballList.add(new billiardBall(17, 25, true, #00FF00, 920, 360, 5)); //green striped
    ballList.add(new billiardBall(17, 25, false, #00FF00, 920, 400, 15)); //green solid
    ballList.add(new billiardBall(17, 25, true, #8B0000, 920, 440, 6)); //dark red striped
    ballList.add(new billiardBall(17, 25, true, #800080, 920, 480, 7)); //purple striped

    pocketList.add(new pocket(20, 150, 145));
    pocketList.add(new pocket(20, 650, 140));
    pocketList.add(new pocket(20, 1145, 145));
    pocketList.add(new pocket(20, 150, 655));
    pocketList.add(new pocket(20, 650, 660));
    pocketList.add(new pocket(20, 1145, 655));
    
    whiteIn = false;
    blackIn = false;
  }
  
  boolean moving(){
  movement = false;
  for(billiardBall ball : boardOne.ballList){
    if(ball.velocity.mag() != 0){
      movement = true;
    }
  }
  return movement;
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
    
    fill(255);
    strokeWeight(1);
    circle(1245, 400, 85);
    fill(255, 0, 0);
    strokeWeight(0);
    circle(1245 + spinAngle.x, 400 + spinAngle.y, 10);
    
    textAlign(CENTER);
    fill(0);
    text("spin",1245,350);
    text("Press enter to reset!", width/2, 50);
    
    for(pocket pocket : pocketList){
      pocket.display();
    }
    for(int i = 0; i < ballList.size(); i++){
      if(!(i==0 && whiteIn)){
        ballList.get(i).display();
      }
      if(whiteIn && !moving()){
        ballList.get(0).position.x=mouseX;
        ballList.get(0).position.y=mouseY;
        ballList.get(0).display();
      }
      ballList.get(i).wallCollide();
      int inRange = 0;
      PVector tempVel = ballList.get(i).velocity;
      if(tempVel.mag() > 0){
        for(billiardBall other : ballList){
        if(ballList.get(i) != other && dist(ballList.get(i).position.x, ballList.get(i).position.y, other.position.x, other.position.y) < 36){
          inRange++;
        }
      }
      for(billiardBall other : ballList){
        if(ballList.get(i) != other && dist(ballList.get(i).position.x, ballList.get(i).position.y, other.position.x, other.position.y) < 36){
          ballList.get(i).ballCollide(other, inRange, tempVel);
        }
      }
    }
    }
    for(int i = 0; i < ballList.size(); i++){
      ballList.get(i).move();}
    for(pocket pocket : pocketList){
      if(pocket.detectGoal(ballList.get(0).position.x,ballList.get(0).position.y)){
        whiteIn = true;
        ballList.get(0).velocity.x = 0;
        ballList.get(0).velocity.y = 0;
        ballList.get(0).position = new PVector(0, 0);
      }
      for(int i = 1; i < ballList.size(); i++){
        if(pocket.detectGoal(ballList.get(i).position.x,ballList.get(i).position.y)){
          if(ballList.get(i).stripes){
            tempStripe++;
            stripe--;
            stripeIn.add(ballList.get(i));
          }else{
          if(ballList.get(i).num!=1){
            tempSolid++;
            solid--;
            solidIn.add(ballList.get(i));
          }
          }
          ballList.remove(i);
          if(i==1){
            blackIn = true;
          }
          i--;
        }
    }
    }
    fill(255);
    stroke(0);
    strokeWeight(2);
    rect(800, 30, 200, 50); //for cueBall "hack" purposes
    fill(0);
    textSize(30);
    text("place cueBall", 820, 60);
  }
  
  boolean stripeScore(){
    if(!moving()){
      if(tempStripe > 0){     
        return true;
      }
    }
    return false;
  }
  boolean solidScore(){
    if(!moving()){
      if(tempSolid > 0){     
        return true;
      }
    }
    return false;
  }
  
  void killBall(float x, float y){
    if(cheatMode){
      for(int i = 1; i < ballList.size(); i++){
        if(dist(x,y,ballList.get(i).position.x,ballList.get(i).position.y) < 17){
          if(ballList.get(i).stripes){
            tempStripe++;
            stripe--;
            stripeIn.add(ballList.get(i));
          }else{
            tempSolid++;
            solid--;
            solidIn.add(ballList.get(i));
          }
          ballList.remove(i);
          if(i==1){
            blackIn = true;
          }
          i--;
        }
    }
    }
  }
  
  void adjustSpin(float x, float y){
    if(!moving()){
      spinAngle = new PVector(x - 1245, y - 400);
      ballList.get(0).spin = PVector.div(spinAngle, 120).rotate(HALF_PI);
    }
  }
}
