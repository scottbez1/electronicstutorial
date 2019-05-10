#include <Arduino.h>
#include <Servo.h>

#include <Adafruit_NeoPixel.h>

Servo servo;

Adafruit_NeoPixel strip(8, D5, NEO_GRB + NEO_KHZ800);

void setup() {
  // put your setup code here, to run once:
  pinMode(D1, OUTPUT);
  pinMode(D2, OUTPUT);
  pinMode(D3, OUTPUT);
  Serial.begin(115200);

  servo.attach(D0);
  strip.begin();
}

void loop() {
  for (int i = 0; i < 8; i++) {
    strip.setPixelColor(i, random(100), random(100), random(100));
  }
  strip.show();
  delay(500);
}