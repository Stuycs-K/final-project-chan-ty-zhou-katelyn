board boardOne;
cueStick stick;
private boolean teamActive;

void setup(){
  background(155); //832222 brown
  size(1300, 800);
  stick = new cueStick(0, 0);
  boardOne = new board();
}

void draw(){
  background(155);
  boardOne.display();
  stick.changePos(boardOne.ballList.get(0).position.x, boardOne.ballList.get(0).position.y);
  if(!boardOne.moving()){
    stick.display();
  }
}

void mouseClicked(){
 if(!boardOne.moving() && mouseY < 785 && mouseY > 725 && mouseX < 785 & mouseX > 525){
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
