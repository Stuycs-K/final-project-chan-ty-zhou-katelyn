board boardOne;
cueStick stick;
private boolean teamActive;
String[] choiceTeam;
int countdown;
int turn;

void setup(){
  background(155); //832222 brown
  size(1300, 800);
  stick = new cueStick(0, 0);
  boardOne = new board();
  teamActive = true;
  choiceTeam = new String[2];
  countdown = 0;
  turn = 1;
}

void draw(){
  background(155);
  boardOne.display();
  displayTeam();
  if(boardOne.moving()){
    countdown++;
  }
  if(!boardOne.moving() && countdown > 0){
    countdown = 0;
    turn++;
    if(choiceTeam[0] == null && teamActive){
      choiceTeam[0] = "stripe";
      choiceTeam[1] = "solid";
    }else if(choiceTeam[0] == null){
      choiceTeam[0] = "solid";
      choiceTeam[1] = "stripe";
    }
  }
  stick.changePos(boardOne.ballList.get(0).position.x, boardOne.ballList.get(0).position.y);
  if(!boardOne.moving() && !boardOne.whiteIn){
    stick.display();
  }
}

void displayTeam(){
  if(teamActive){
    textSize(30);
    fill(0);
    text("Team One's turn! - " + choiceTeam[0], 30, 30);
  }else{
    textSize(30);
    fill(0);
    text("Team Two's turn! - " + choiceTeam[1], 30, 30);
  }
  text("Turn " + turn, 30, 60);
}

void mouseClicked(){
 if(!boardOne.moving() && !boardOne.whiteIn && mouseY < 785 && mouseY > 725 && mouseX < 785 & mouseX > 525){
   stick.applyHit(boardOne.ballList.get(0));
 } else if(mouseY < 650 && mouseY > 150 && mouseX < 80 & mouseX > 35){
   stick.adjustPower((mouseY-150)/5);
 } else if(!boardOne.whiteIn){
   stick.changeDir(boardOne.ballList.get(0).position);
 }else if(boardOne.whiteIn && mouseX > 178 && mouseX < 1122 && mouseY > 178 && mouseY < 1092){
   boardOne.whiteIn = false;
   
 }
}

boolean turn(){
  if(teamActive){}
  return true;
}
