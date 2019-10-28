void setup()
{
  size(500, 500);
  background(255);
  strokeWeight(2);
  fill(255);

  //line background
  for (int a = -500; a < 500; a = a + 10)
  {
    bgLine(a, 1);
  }

  //overlaying the different shapes
  for (int b = 0; b > -46; b = b - 3)
  {
    centerSquare(b, -b);
    topLeftRectangle(b, -b);
    topRightSquare (b, -b);
    bottomRectangle (b, -b);
    rightRectangle (b, -b);
    topSquare (b, -b);
    leftSquare (b, -b);
    bottomRightRectangle (b, -b);
    centerSmallSquare (b, -b);
  }
}
void bgLine(int x, int y) //background lines
{
  pushMatrix();
  translate(x, y);
  line (0, 500, 500, 0);
  popMatrix();
}

void centerSquare (int x, int y) //central square
{
  pushMatrix();
  translate(x, y);
  rect(200, 200, 120, 120);
  popMatrix();
}

void topLeftRectangle (int x, int y) //top left rectangle
{
  pushMatrix();
  translate(x, y);
  rect (50, 30, 70, 30);
  popMatrix();
}

void topRightSquare (int x, int y) //top right square
{
  pushMatrix();
  translate(x, y);
  rect (470, 10, 20, 20);
  popMatrix();
}

void bottomRectangle (int x, int y) //bottom rectangle
{
  pushMatrix ();
  translate (x, y);
  rect (50, 400, 300, 50);
  popMatrix ();
}

void rightRectangle (int x, int y) //right rectangle
{
 pushMatrix ();
 translate (x, y);
 rect (450, 150, 30, 100);
 popMatrix();
}

void topSquare (int x, int y) //top square
{
 pushMatrix ();
 translate (x, y);
 rect (width/2, height/8, 50, 50);
 popMatrix ();
}

void leftSquare (int x, int y) //left square
{
 pushMatrix();
 translate (x, y);
 rect (width/8, height/2, 70, 70);
 popMatrix();
}

void bottomRightRectangle (int x, int y) //bottom right rectangle
{
 pushMatrix();
 translate (x, y);
 rect (460, 420, 10, 10);
 popMatrix();
}

void centerSmallSquare (int x, int y) //center small square
{
 pushMatrix();
 translate (x, y);
 rect (320, 170, 30, 30);
 popMatrix();
}
