/*
A game of "Pong." Mouse controls the paddle.
The ball gets faster every time it hits the paddle, but loses speed if it is behind the paddle.

Based on http://www.openprocessing.org/sketch/48960 and examples from class.
*/

float XSPEED = 1;  //Horizontal speed
float YSPEED = 5;  //Vertical speed
float CIRCLESIZE = random (5, 20);

class movingBall {

  //Class properties
  float x, y, xSpeed, ySpeed;

  //Constructor
  movingBall(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    xSpeed = XSPEED;
    ySpeed = YSPEED;
  }

  //Adds speed to position
  void update() {
    x += xSpeed;
    y += ySpeed;
  }

  //Checks if it has crashed against the paddle, the wall, the roof or the floor
  void checkCollisions() {
    float r = CIRCLESIZE/2;

    //Wall check
    if ( (x<r) || (x>width-r)) {
      xSpeed = -xSpeed;
    }

    //Floor/roof check
    if ( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed;
    }

    //Paddle front check
    if ((x>390-r) && (y<mouseY+60) && (y>mouseY-60)) {
      xSpeed++;
      xSpeed = -xSpeed;
    }

    //Paddle back check
    if ((x>410+r) && (y<mouseY+60) && (y>mouseY-60)) {
      xSpeed--;
      xSpeed = -xSpeed;
    }
  }

  //Draws the ball
  void drawCircle() {
    fill(255);
    ellipse(x, y, CIRCLESIZE, CIRCLESIZE);
  }
}


void paddle () { //draws a controllable rectangle
  rectMode (CENTER);
  fill(255);
  rect (400, mouseY, 20, 120);
}

//New ball, starting halfway across the screen at an arbitrary y point
movingBall ball = new movingBall (250, random(30, height-30));

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background (0);

  ball.update();
  ball.checkCollisions();
  ball.drawCircle();

  paddle();
}
