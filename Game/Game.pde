board boardOne;
cueStick stick;
private boolean teamActive;
String[] choiceTeam;
int countdown;
int turn;
float powerCoord;
boolean oneWin, twoWin;

void setup(){
  size(1300, 800);
  stick = new cueStick(0, 0);
  boardOne = new board();
  teamActive = true;
  choiceTeam = new String[2];
  countdown = 0;
  turn = 1;
  powerCoord = 200.0;
  oneWin = false;
  twoWin = false;
}

void draw(){
  System.out.println(boardOne.ballList.get(0).spin.x + " " + boardOne.ballList.get(0).spin.y + " " + countdown);
  background(175);
  boardOne.display();
  displayTeam();
  rect(35,powerCoord,45,20);
  if(boardOne.moving()){
    countdown++;
    boardOne.adjustSpin(0, 0);
    boardOne.ballList.get(0).count = countdown;
  }
  if(!boardOne.moving() && countdown > 0){ //this is only called AFTER a move is made
    countdown = 0;
    checkWin();
    turn++;
    chooseTeam();
    advanceTurn();
    boardOne.tempSolid = 0;
    boardOne.tempStripe = 0;
    boardOne.adjustSpin(1245, 400);
  }
  stick.changePos(boardOne.ballList.get(0).position.x, boardOne.ballList.get(0).position.y);
  if(!boardOne.moving() && !boardOne.whiteIn){
    stick.display();
  }
  displayWin();
}

void displayTeam(){
  if(teamActive){
    textSize(30);
    fill(0);
    text("Player 1's turn!", 30, 30);
  }else{
    textSize(30);
    fill(0);
    text("Player 2's turn!", 30, 30);
  }
  if(choiceTeam[0]!=null){
    if(teamActive){
      text(" - "+choiceTeam[0], 215, 30);
    } else{
      text(" - "+choiceTeam[1], 215, 30);
    }
  }
  text("Turn " + turn, 30, 60);
}

void mouseClicked(){
 if(!boardOne.moving() && !boardOne.whiteIn && mouseY < 785 && mouseY > 725 && mouseX < 785 & mouseX > 525){ // shoot button
   stick.applyHit(boardOne.ballList.get(0));
 }else if(mouseY < 80 && mouseY > 30 && mouseX < 1000 & mouseX > 800){ // place cueball button
   boardOne.whiteIn = true;
 } else if(boardOne.cheatMode){
   boardOne.killBall(mouseX, mouseY);
   if(choiceTeam[0] == null){
     if((teamActive && boardOne.stripeIn.size()==1) || (!teamActive && boardOne.solidIn.size()==1)){
       choiceTeam[0] = "stripes";
       choiceTeam[1] = "solids";
      }else if((teamActive && boardOne.solidIn.size()==1) || (!teamActive && boardOne.stripeIn.size()==1)){
        choiceTeam[0] = "solids";
        choiceTeam[1] = "stripes";
      }
    }
    checkWin();
 } else if(mouseY < 650 && mouseY > 150 && mouseX < 80 & mouseX > 35){ // change power button
   powerCoord = mouseY;
   stick.adjustPower((mouseY-150)/5);
 } else if(dist(1245, height / 2, mouseX, mouseY) < 85/2){ //set spin
   boardOne.adjustSpin(mouseX, mouseY);
 }else if(!boardOne.whiteIn){ // change cueStick direction
   stick.changeDir(boardOne.ballList.get(0).position);
 }else if(boardOne.whiteIn && mouseX > 178 && mouseX < 1122 && mouseY > 178 && mouseY < 1092){ // place cueball after shot in
   boardOne.whiteIn = false;
 }
}

void keyPressed(){
  if(key==' '&&!boardOne.moving()){
    stick.applyHit(boardOne.ballList.get(0));
  }
  else if(key == ENTER){
    setup();
  }
  else if(key == 'q'){
    boardOne.cheatMode = !boardOne.cheatMode;
  }
}

void checkWin(){
  if(boardOne.blackIn){
      if(teamActive){
        if((choiceTeam[0].equals("stripes") && boardOne.stripe > 0) || (choiceTeam[0].equals("solids") && boardOne.solid > 0)){
          twoWin = true;
        }else if((choiceTeam[0].equals("stripes") && boardOne.stripe == 0) || (choiceTeam[0].equals("solids") && boardOne.solid == 0)){
          oneWin = true;
        }
      }else{
        if((choiceTeam[1].equals("stripes") && boardOne.stripe > 0) || (choiceTeam[1].equals("solids") && boardOne.solid > 0)){
          oneWin = true;
        }else if((choiceTeam[1].equals("stripes") && boardOne.stripe == 0) || (choiceTeam[1].equals("solids") && boardOne.solid == 0)){
          twoWin = true;
        }
      }
    }
}

void chooseTeam(){
if(choiceTeam[0] == null){
      if((teamActive && boardOne.stripeScore()) || (!teamActive && boardOne.solidScore())){
        choiceTeam[0] = "stripes";
        choiceTeam[1] = "solids";
      }else if((teamActive && boardOne.solidScore()) || (!teamActive && boardOne.stripeScore())){
        choiceTeam[0] = "solids";
        choiceTeam[1] = "stripes";
      }
      }
}

void advanceTurn(){
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
}

void displayWin(){
  if(!boardOne.moving() && boardOne.blackIn){
    fill(0, 0, 255);
    textAlign(CENTER);
    textSize(150);
    if(oneWin){
      text("Player one wins!", width / 2, height / 2);
    }else{
    text("Player two wins!", width / 2, height / 2);
    }
  }
}
