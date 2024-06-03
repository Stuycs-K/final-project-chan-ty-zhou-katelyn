board boardOne;
cueStick stick;
private boolean teamActive;
String[] choiceTeam;
int countdown;
int turn;
float powerCoord;

void setup(){
  background(155);
  size(1300, 800);
  stick = new cueStick(0, 0);
  boardOne = new board();
  teamActive = true;
  choiceTeam = new String[2];
  countdown = 0;
  turn = 1;
  powerCoord = 200.0;
}

void draw(){
  background(155);
  boardOne.display();
  displayTeam();
  rect(35,powerCoord,45,20);
  if(boardOne.moving()){
    countdown++;
  }
  if(!boardOne.moving() && countdown > 0){ //this is only called AFTER a move is made
    countdown = 0;
    turn++;
    if(choiceTeam[0] == null){
      if((teamActive && boardOne.stripeScore()) || (!teamActive && boardOne.solidScore())){
        choiceTeam[0] = "stripes";
        choiceTeam[1] = "solids";
      }else if((teamActive && boardOne.solidScore()) || (!teamActive && boardOne.stripeScore())){
        choiceTeam[0] = "solids";
        choiceTeam[1] = "stripes";
      }
      }
      if(teamActive){
        teamActive = false;
        if((boardOne.stripeScore() && choiceTeam[0].equals("stripes")) || (boardOne.solidScore() && choiceTeam[0].equals("solids"))){
          teamActive = true;
        }
      }else{
        teamActive = true;
        if((boardOne.stripeScore() && choiceTeam[1].equals("stripes")) || (boardOne.solidScore() && choiceTeam[1].equals("solids"))){
          teamActive = false;
        }
      }
      
      boardOne.tempSolid = 0;
      boardOne.tempStripe = 0;
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
    //text("Team One's turn!" + choiceTeam[0], 30, 30);
    text("Player 1's turn!", 30, 30);
  }else{
    textSize(30);
    fill(0);
    //text("Team Two's turn! - " + choiceTeam[1], 30, 30);
    text("Player 2's turn!", 30, 30);
  }
  text("Turn " + turn, 30, 60);
}

void mouseClicked(){
 if(!boardOne.moving() && !boardOne.whiteIn && mouseY < 785 && mouseY > 725 && mouseX < 785 & mouseX > 525){
   stick.applyHit(boardOne.ballList.get(0));
 } else if(mouseY < 650 && mouseY > 150 && mouseX < 80 & mouseX > 35){
   powerCoord = mouseY;
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
