/*
Inspired from example code.
*/

import processing.serial.*;

//Colour of the ellipses
int ellipseColour = 0;

// The serial port.
Serial myPort;

void setup() {
  size(500, 500);
  background (0);
  
  frameRate (120); //to make it faster

  //Port in use
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  int ellipseSize = (int) random (1, 40);
  
  fill(ellipseColour);
  
  ellipse(random(width), random(height), ellipseSize, ellipseSize);
}

void serialEvent(Serial myPort) {
  // read a byte from the serial port:
  int inByte = myPort.read();
  if (inByte == 'H') {
    ellipseColour = 255;
  } else if (inByte == 'L') {
    ellipseColour = 0;
  }
}
