/*
  Inspired by "Graph" and "Serial Call Response" examples
  by David A. Mellis, Tom Igoe, and Scott Fitzgerald.
*/

//for a spaced-out board
const int upButtonPin = 12;
const int downButtonPin = 10;
const int leftButtonPin = 8;
const int rightButtonPin = 7;
const int startButtonPin = 2;

void setup() {
  // initialize serial communication
  Serial.begin(9600);
  pinMode (upButtonPin, INPUT);
  pinMode (downButtonPin, INPUT);
  pinMode (leftButtonPin, INPUT);
  pinMode (rightButtonPin, INPUT);
  pinMode (startButtonPin, INPUT);
}

void loop() {

  //reading button presses on all 4 buttons.
  int upButtonPress = digitalRead (upButtonPin);
  int downButtonPress = digitalRead (downButtonPin);
  int leftButtonPress = digitalRead (leftButtonPin);
  int rightButtonPress = digitalRead (rightButtonPin);
  int startButtonPress = digitalRead (startButtonPin);

  //I will use WASD for simplicity to make a mimic to games, P for the start button (S was taken)
  if (upButtonPress == HIGH) {
    Serial.write('W');
  }

  if (leftButtonPress == HIGH) {
    Serial.write('A');
  }
  
  if (downButtonPress == HIGH) {
    Serial.write('S');
  }

  if (rightButtonPress == HIGH) {
    Serial.write('D');
  }

  if (startButtonPress == HIGH) {
    Serial.write('P');
  }
}
