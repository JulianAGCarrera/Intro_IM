/*
  Inspired by "Graph" and "Serial Call Response" examples.
*/

int buttonPin = 4;

void setup() {
  // initialize serial communication
  Serial.begin(9600);
  pinMode (buttonPin, INPUT);
}

void loop() {

  int buttonPress = digitalRead (buttonPin); //reading button press

  if (buttonPress == 1) {
    Serial.write('H');
  } else {
    Serial.write('L');
  }
}
