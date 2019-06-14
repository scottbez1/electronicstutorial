#include <Arduino.h>

// See https://paper.dropbox.com/doc/Intro-to-Electronics-reference--AfBd2OEIeJC~TBczoqEbNMRRAg-V2P2FikAP2KFyhsvtbmeq for examples/reference

void setup() {
  pinMode(D4, OUTPUT);
}

void loop() {
  digitalWrite(D4, LOW);
  delay(100);
  digitalWrite(D4, HIGH);
  delay(300);
  digitalWrite(D4, LOW);
  delay(300);
  digitalWrite(D4, HIGH);
  delay(1300);
}