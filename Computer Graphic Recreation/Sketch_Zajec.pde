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
    bottomRightRectangle (b, -b);
    topSquare (b, -b);
    leftSquare (b, -b);
    bottomRightSquare (b, -b);
    centerSmallSquare (b, -b);
    topLeftShape (b, -b);
    topRightShape (b, -b);
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

void bottomRightRectangle (int x, int y) //right rectangle
{
  pushMatrix ();
  translate (x, y);
  rect (450, 310, 30, 80);
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

void bottomRightSquare (int x, int y) //bottom right square
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

void topLeftShape (int x, int y) //shape at top left
{
  PShape topLeft;

  topLeft = createShape ();
  topLeft.beginShape ();
  topLeft.fill (255);
  topLeft.strokeWeight(2);
  topLeft.vertex (50, 50);
  topLeft.vertex (60, 50);
  topLeft.vertex (60, 75);
  topLeft.vertex (90, 75);
  topLeft.vertex (90, 100);
  topLeft.vertex (60, 100);
  topLeft.vertex (30, 100);
  topLeft.vertex (30, 50);
  topLeft.endShape(CLOSE);

  pushMatrix();
  translate(x, y);
  shape (topLeft, 50, 70);
  popMatrix();
}

void topRightShape (int x, int y) //shape at top right
{
  PShape topRight;

  topRight = createShape ();
  topRight.beginShape ();
  topRight.fill (255);
  topRight.strokeWeight(2);
  topRight.vertex (400, 50);
  topRight.vertex (430, 50);
  topRight.vertex (430, 100);
  topRight.vertex (460, 100);
  topRight.vertex (460, 150);
  topRight.vertex (430, 150);
  topRight.vertex (430, 200);
  topRight.vertex (400, 200);
  topRight.vertex (400, 150);
  topRight.vertex (370, 150);
  topRight.vertex (370, 100);
  topRight.vertex (400, 100);
  topRight.endShape(CLOSE);
  
  pushMatrix();
  translate(x, y);
  shape (topRight, 50, 70);
  popMatrix();
}
