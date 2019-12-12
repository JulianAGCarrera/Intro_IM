/*
  Inspired by "Graph" and "Serial Call Response" examples.
 By David A. Mellis, Tom Igoe, and Scott Fitzgerald.
 
 Inspired on Rick Astley memes and the scary maze game from the old internet.
 */

import processing.serial.*;
import ddf.minim.*;

PImage Rick;

Minim RickRoll;
AudioPlayer player;

Serial myPort;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


float playerCenterX; //arbitrary point near right edge of screen
float playerCenterY; //arbitrary point near bottom of screen

boolean startPress = false;  //tracks whether the action button is pressed

int gameState; //to keep track of different states
int start = 0;
int level1 = 1;
int level2 = 2;
int level3 = 3;
int loss = 4;
int rickRoll = 5;
int end = 6;
int levelTransition1 = 7;  //transition between level 1 and 2
int levelTransition2 = 8;  //transition between level 2 and 3
int levelTransition3 = 9;  //transition between level 3 and RickRoll

boolean OnLevel1 = false;  //to make player return to the level they were on instead of to the start.
boolean OnLevel2 = false;
boolean OnLevel3 = false;

color black = color(0, 0, 0);  //to colour objects


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void setup() {

  noCursor();

  //Port in use
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);

  Rick = loadImage ("Data/Rick.png");

  RickRoll = new Minim (this);
  player = RickRoll.loadFile ("Data/RickRoll.mp3");

  fullScreen();

  gameState = loss;  //to start at the beginning

  noStroke();

  textAlign(CENTER);
  textSize(60);

  frameRate (60);
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void serialEvent(Serial myPort) {
  //read a byte from the serial port:
  int inByte = myPort.read();

  float speed = 0.2;  //to determine change in position

  if (inByte == 'W') {
    if (gameState == level1) {
      playerCenterY = playerCenterY - speed;  //to go up
    }

    if (gameState == level2) {
      playerCenterY = playerCenterY - speed;
    }

    if (gameState == level3) {
      playerCenterY = playerCenterY - speed;
    }
  }

  if (inByte == 'A') {
    if (gameState == level1) {
      playerCenterX = playerCenterX - speed;  //to go left
    }

    if (gameState == level2) {
      playerCenterX = playerCenterX - speed;
    }

    if (gameState == level3) {
      playerCenterX = playerCenterX - speed;
    }
  }

  if (inByte == 'S') {
    if (gameState == level1) {
      playerCenterY = playerCenterY + speed;  //to go down
    }

    if (gameState == level2) {
      playerCenterY = playerCenterY + speed;
    }

    if (gameState == level3) {
      playerCenterY = playerCenterY + speed;
    }
  }

  if (inByte == 'D') {
    if (gameState == level1) {
      playerCenterX = playerCenterX + speed;  //to go right
    }

    if (gameState == level2) {
      playerCenterX = playerCenterX + speed;
    }

    if (gameState == level3) {
      playerCenterX = playerCenterX + speed;
    }
  }

  if (inByte == 'P') {
    if (gameState == start) {  //start screen
      startPress = true;
    }

    if (gameState == loss) {  //losing screen
      startPress = true;
    }

    if (gameState == rickRoll) {  //Rick-roll
      startPress = true;
    }

    if (gameState == end) {  //ending screen
      startPress = true;
    }

    if (gameState == levelTransition1) {  //transition between 1 and 2
      startPress = true;
    }

    if (gameState == levelTransition2) {  //transition between 2 and 3
      startPress = true;
    }

    if (gameState == levelTransition2) {  //transition between 3 and rickRoll
      startPress = true;
    }
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void player() {

  int playerSize = 15; //size of player

  fill (black);
  rect(playerCenterX, playerCenterY, playerSize, playerSize);  //player is a square
  fill (255, 0, 0);
  rect (playerCenterX, playerCenterY, 5, 5);  //actual collider, player centre
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void L1BottomEdge() {
  rect (0, 1000, width, height);

  if (playerCenterY >= 1000) {  //all throughout, these local if() statements track collision detection
    gameState = loss;
  }
}


void L1TopEdge() {
  rect (0, 0, width, 200);

  if (playerCenterY <= 200) {  //collision detection
    gameState = loss;
  }
}


void L1RightEdge() {
  rect (1800, 0, width, height);

  if (playerCenterX >= 1800) {  //collision detection
    gameState = loss;
  }
}


void L1LeftEdge() {
  rect (0, 0, 80, height);

  if (playerCenterX <= 80) {  //collision detection
    gameState = loss;
  }
}


void L1Obstacle() {
  rect (300, 500, 1300, height);

  if (playerCenterX >= 300
    && playerCenterX <= 1600 
    && playerCenterY >= 500) {  //collision detection
    gameState = loss;
  }
}


void L1Goal() {
  rect (80, 720, 220, 280);

  if (playerCenterX >= 80
    && playerCenterX <= 300 
    && playerCenterY >= 720) {  //collision detection

    gameState = levelTransition1;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void L2BottomEdge() {
  rect(0, 1000, width, height);

  if (playerCenterY >= 1000) {  //collision detection
    gameState = loss;
  }
}


void L2TopEdge() {
  rect (0, 0, width, 100);

  if (playerCenterY <= 100) {  //collision detection
    gameState = loss;
  }
}


void L2LeftEdge() {
  rect (0, 0, 100, height);

  if (playerCenterX <= 100) {  //collision detection
    gameState = loss;
  }
}


void L2RightEdge() {
  rect (1820, 0, width, height);

  if (playerCenterX >= 1820) {  //collision detection
    gameState = loss;
  }
}


void L2Obstacle1 () {
  rect (1500, 300, 100, height);

  if (playerCenterX >= 1500
    && playerCenterX <= 1600
    && playerCenterY >= 300) {  //collision detection
    gameState = loss;
  }
}


void L2Obstacle2 () {
  rect (1300, 0, 100, 800);

  if (playerCenterX >= 1300
    && playerCenterX <= 1400
    && playerCenterY <= 800) {  //collision detection
    gameState = loss;
  }
}


void L2Obstacle3 () {
  rect (1100, 300, 100, height);

  if (playerCenterX >= 1100
    && playerCenterX <= 1200
    && playerCenterY >= 300) {  //collision detection
    gameState = loss;
  }
}


void L2Obstacle4 () {
  rect (1000, 0, 50, 900);

  if (playerCenterX >= 1000
    && playerCenterX <= 1050
    && playerCenterY <= 900) {  //collision detection
    gameState = loss;
  }
}


void L2Obstacle5 () {
  rect (900, 200, 50, 900);

  if (playerCenterX >= 900
    && playerCenterX <= 950
    && playerCenterY >= 200) {  //collision detection
    gameState = loss;
  }
}


void L2Obstacle6 () {
  rect (800, 0, 50, 900);

  if (playerCenterX >= 800
    && playerCenterX <= 850
    && playerCenterY <= 900) {  //collision detection
    gameState = loss;
  }
}


void L2Obstacle7 () {
  rect (680, 150, 80, 900);

  if (playerCenterX >= 680
    && playerCenterX <= 760
    && playerCenterY >= 150) {  //collision detection
    gameState = loss;
  }
}


void L2Obstacle8 () {
  rect (560, 0, 80, 950);

  if (playerCenterX >= 560
    && playerCenterX <= 640
    && playerCenterY <= 950) {  //collision detection
    gameState = loss;
  }
}


void L2Obstacle9 () {
  rect (440, 150, 80, 900);

  if (playerCenterX >= 440
    && playerCenterX <= 520
    && playerCenterY >= 150) {  //collision detection
    gameState = loss;
  }
}


void L2Obstacle10 () {
  rect (320, 0, 80, 950);

  if (playerCenterX >= 320
    && playerCenterX <= 400
    && playerCenterY <= 950) {  //collision detection
    gameState = loss;
  }
}


void L2Obstacle11 () {
  rect (0, 0, 320, 950);

  if (playerCenterX <= 320
    && playerCenterY <= 950) {  //collision detection
    gameState = loss;
  }
}


void L2Goal() {
  rect (100, 950, 200, 50);

  if (playerCenterX >= 100
    && playerCenterX <= 300 
    && playerCenterY >= 950
    && playerCenterY <= 1000) {  //collision detection
    gameState = levelTransition2;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void L3BottomEdge() {
  rect (0, 1000, width, height);

  if (playerCenterY >= 1000) {  //collision detection
    gameState = loss;
  }
}


void L3TopEdge() {
  rect (0, 0, width, 100);

  if (playerCenterY <= 100) {  //collision detection
    gameState = loss;
  }
}


void L3RightEdge() {
  rect (1820, 0, width, height);

  if (playerCenterX >= 1800) {  //collision detection
    gameState = loss;
  }
}


void L3LeftEdge() {
  rect (0, 0, 100, height);
  if (playerCenterX <= 100) {  //collision detection
    gameState = loss;
  }
}


void L3FirstLeftWall() {
  rect (1450, 250, 100, height); 

  if (playerCenterX >= 1450
    && playerCenterX <= 1550 
    && playerCenterY >= 250) {  //collision detection
    gameState = loss;
  }
}


void L3FirstBottomWall() {
  rect (200, 250, 1300, 100);

  if (playerCenterY >= 250
    && playerCenterY <= 350 
    && playerCenterX >= 200
    && playerCenterX <= 1500) {  //collision detection
    gameState = loss;
  }
}


void L3FirstRightWall() {
  rect (200, 250, 100, 650);

  if (playerCenterX >= 200
    && playerCenterX <= 300
    && playerCenterY >= 250
    && playerCenterY <= 900) {  //collision detection
    gameState = loss;
  }
}


void L3FirstTopWall() {
  rect (300, 800, 1050, 100); 

  if (playerCenterX >= 300
    && playerCenterX <= 1350
    && playerCenterY >= 800
    && playerCenterY <= 900) {  //collision detection
    gameState = loss;
  }
}


void L3SecondLeftWall() {
  rect (1250, 400, 100, 500);

  if (playerCenterX >=1250
    && playerCenterX <= 1350
    && playerCenterY >= 400
    && playerCenterY <=900) {  //collision detection
    gameState = loss;
  }
}


void L3SecondBottomWall() {
  rect (350, 400, 900, 100);

  if (playerCenterX >= 350
    && playerCenterX <= 1250
    && playerCenterY >= 400
    && playerCenterY <= 500) {  //collision detection
    gameState = loss;
  }
}


void L3SecondRightWall() {
  rect (350, 400, 100, 350);

  if (playerCenterX >= 350
    && playerCenterX <= 450
    && playerCenterY >= 400
    && playerCenterY <= 750) {  //collision detection
    gameState = loss;
  }
}


void L3SecondTopWall() {
  rect (350, 650, 850, 100);

  if (playerCenterX >= 350
    && playerCenterX <= 1200
    && playerCenterY >= 650
    && playerCenterY <= 750) {  //collision detection
    gameState = loss;
  }
}


void L3ThirdLeftWall() {
  rect (1100, 530, 100, 120);

  if (playerCenterX >= 1100
    && playerCenterX <= 1200
    && playerCenterY >= 530
    && playerCenterY <= 650) {  //collision detection
    gameState = loss;
  }
}


void L3ThirdBottomWall() {
  rect (470, 530, 700, 50);

  if (playerCenterX >= 470
    && playerCenterX <= 1170
    && playerCenterY >= 530 
    && playerCenterY <= 580) {  //collision detection
    gameState = loss;
  }
}


void L3ThirdRightWall() {
  rect (470, 530, 30, 100);

  if (playerCenterX >= 470
    && playerCenterX <= 500
    && playerCenterY >= 530
    && playerCenterY <= 630) {  //collision detection
    gameState = loss;
  }
}


void L3ThirdTopWall() {
  rect (470, 620, 620, 10);

  if (playerCenterX >= 470
    && playerCenterX <= 1090
    && playerCenterY >= 620
    && playerCenterY <= 630) {  //collision detection
    gameState = loss;
  }
}


void L3Goal() {
  rect (500, 580, 100, 40);

  //numbers don't match the position of the object so the gameState changes before it is expected
  if (playerCenterX >= 700
    && playerCenterX <= 800
    && playerCenterY >= 580
    && playerCenterY <= 620) {  //collision detection
    gameState = levelTransition3;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void keyPressed() {  //used in case someone leaves the game halfway through to reset

  if (key == RETURN || key == ENTER) {  // PC = Enter, MAC = Return
    gameState = start;
  }
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void draw() {

  color bg = color(0, 255, 255);  //to mimic the movable part of the maze.

  //check for gameState start, which is the starting state.
  if (gameState == start) {
    startPress = false;  //failsafe for accidental presses
    playerCenterX = 1700;
    playerCenterY = 950;
    background (black);
    fill (255, 255, 255);
    text ("press the action button to start", width/2, height/2);
    text ("don't let your red core touch the walls", width/2, (height/2)+70);
    if (startPress == true) {
      gameState = level1;
      startPress = false;
    }
  }

  //check for gameState level1, which is the first level
  if (gameState == level1) {
    OnLevel1 = true;
    background (bg);
    rectMode(CENTER);
    player();
    fill (black);
    rectMode(CORNER);
    L1BottomEdge();
    L1TopEdge();
    L1RightEdge();
    L1LeftEdge();
    L1Obstacle();
    fill (255, 0, 0);
    L1Goal();
  }

  //check for gameState levelTransition1, which is the transition between levels 1 and 2
  if (gameState == levelTransition1) {
    startPress = false;
    playerCenterX = 1700;
    playerCenterY = 950;
    background (black);
    fill (255, 255, 255);
    text ("you finished level 1 of 4", width/2, height/2);
    text ("press action to go to level 2", width/2, (height/2)+70);
    if (startPress == true) {
      gameState = level2;
      startPress = false;
    }
  }

  //check for gameState level2, which is the second level
  if (gameState == level2) {
    OnLevel1 = false;
    OnLevel2 = true;
    background (bg);
    rectMode(CENTER);
    player();
    fill (black);
    rectMode(CORNER);
    L2BottomEdge();
    L2TopEdge();
    L2LeftEdge();
    L2RightEdge();
    L2Obstacle1();
    L2Obstacle2();
    L2Obstacle3();
    L2Obstacle4();
    L2Obstacle5();
    L2Obstacle6();
    L2Obstacle7();
    L2Obstacle8();
    L2Obstacle9();
    L2Obstacle10();
    L2Obstacle11();
    fill (255, 0, 0);
    L2Goal();
  }

  //check for gameState levelTransition2, which is the transition between levels 2 and 3
  if (gameState == levelTransition2) {
    startPress = false;
    playerCenterX = 1700;
    playerCenterY = 950;
    background (black);
    fill (255, 255, 255);
    text ("you finished level 2 of 4", width/2, height/2);
    text ("press action to go to level 3", width/2, (height/2)+70);
    if (startPress == true) {
      gameState = level3;
      startPress = false;
    }
  }

  //check for gameState level3, which is the third level.
  if (gameState == level3) {
    OnLevel2 = false;
    OnLevel3 = true;
    background (bg);
    rectMode(CENTER);
    player();
    fill (black);
    rectMode(CORNER);
    L3BottomEdge();
    L3TopEdge();
    L3RightEdge();
    L3LeftEdge();
    L3FirstLeftWall();
    L3FirstBottomWall();
    L3FirstRightWall();
    L3FirstTopWall();
    L3SecondLeftWall();
    L3SecondBottomWall();
    L3SecondRightWall();
    L3SecondTopWall();
    L3ThirdLeftWall();
    L3ThirdBottomWall();
    L3ThirdRightWall();
    L3ThirdTopWall();
    fill (255, 0, 0);
    L3Goal();
  }

  //check for gameState loss, which is the losing state.
  if (gameState == loss) {
    startPress = false;
    playerCenterX = 1700;
    playerCenterY = 950;
    background (black);
    fill (255, 255, 255);
    text ("you lost", width/2, height/2);
    text ("press action to start again", width/2, ((height/2)+70));
    if (startPress == true) {
      if (OnLevel1 == true) {
        gameState = level1;
        startPress = false;
      }
      if (OnLevel2 == true) {
        gameState = level2;
        startPress = false;
      }
      if (OnLevel3 == true) {
        gameState = level3;
        startPress = false;
      }
    }
  }

  //check for gameState levelTransition3, which is the transition between level 3 and the RickRoll
  if (gameState == levelTransition3) {
    startPress = false;
    background (black);
    if (startPress == true) {
      delay (100);
      gameState = rickRoll;
    }
    if (startPress == false) {
      gameState = rickRoll;
    }
  }

  //check for gameState rickRoll, which is the Rick Roll.
  if (gameState == rickRoll) {
    OnLevel1 = false;
    OnLevel2 = false;
    OnLevel3 = false;
    startPress = false;
    player.play();
    image (Rick, 0, 0, width, height);
    if (startPress == true) {
      gameState = end;
      player.pause();
      startPress = false;
    }
  }


  //check for gameState end, which is the final screen.
  if (gameState == end) {
    startPress = false;
    background (black);
    fill (255, 255, 255);
    text ("thank you for playing", width/2, height/2);
    text ("press action to start again", width/2, ((height/2)+70));
    if (startPress == true) {
      gameState = start;
      player.rewind();
      startPress = false;
    }
  }
}
