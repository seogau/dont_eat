int leftState = 0;
int rightState = 0;
int jumpState = 0;
int leftpin = 2;
int rightpin = 3;
int jumppin = 4;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(leftpin, INPUT);
  pinMode(rightpin, INPUT);
  pinMode(jumppin, INPUT);
}

void loop() {
  leftState = digitalRead(leftpin);
  rightState = digitalRead(rightpin);
  jumpState = digitalRead(jumppin);
//    Serial.println(rightState); 
  if (jumpState == LOW) {
    if ((leftState == HIGH) && (rightState == HIGH)) {
      Serial.write(0);
    } else if ((leftState == HIGH) && (rightState == LOW)) {
      Serial.write(1);
    } else if ((leftState == LOW) && (rightState == HIGH)) {
      Serial.write(2);
    } else {
      Serial.write(3);
    }
    delay(100);
  } else {
    Serial.write(100);
    delay(100);
  }
}
