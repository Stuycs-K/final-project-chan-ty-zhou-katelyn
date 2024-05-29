ArrayList<billiardBall> ballList;
ArrayList<pocket> pocketList;
board boardOne;
cueStick stick;
static int backColor = 155;
static int countStripe = 0;
static int countSolid = 0;
private boolean teamActive;
private boolean movement;

void setup(){
  background(backColor); //832222 brown
  size(1300, 800);
  stick = new cueStick(0, 0);
  boardOne = new board();
}

void draw(){
  background(backColor);
  boardOne.display();
  stick.changePos(boardOne.ballList.get(0).position.x, boardOne.ballList.get(0).position.y);
  if(!moving()){
    stick.display();
  }
}

void mouseClicked(){
 if(!moving() && mouseY < 785 && mouseY > 725 && mouseX < 785 & mouseX > 525){
   stick.applyHit(boardOne.ballList.get(0));
 } else if(mouseY < 650 && mouseY > 150 && mouseX < 80 & mouseX > 35){
   stick.adjustPower((mouseY-150)/5);
 } else{
   stick.changeDir(boardOne.ballList.get(0).position);
 }
}

boolean turn(){
  if(teamActive){}
  return true;
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
