#include <Arduino.h>

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