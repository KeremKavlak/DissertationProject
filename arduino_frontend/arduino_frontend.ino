
void setup() {
  //start serial connection
  Serial.begin(9600);
  //configure pin 2, 3, 4, 5, 6 as an input and enable the internal pull-up resistor
  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, INPUT_PULLUP);
  pinMode(6, INPUT_PULLUP);
}

void loop() {
  //read the pushbutton value into a variable
  int Button1 = digitalRead(2);
  int Button2 = digitalRead(3);
  int Button3 = digitalRead(4);
  int Button4 = digitalRead(5);
  int Button5 = digitalRead(6);
  //print out the value of the pushbutton
  //Serial.println(sensorVal);

  // Keep in mind the pull-up means the pushbutton's logic is inverted. It goes
  // HIGH when it's open, and LOW when it's pressed. Turn on pin 13 when the
  // button's pressed, and off when it's not:
  if (Button1 == LOW ) {
    //digitalWrite(13, LOW);
    //delay(500L);
    Serial.println("btn1");
    delay(500L);
  }
  else if (Button2 == LOW){
    //delay(500L);
    Serial.println("btn2");
    delay(500L);
    } 
  else if (Button3 == LOW){
    //delay(500L);
    Serial.println("btn3");
    delay(500L);
    }
  else if (Button4 == LOW){
    //delay(500L);
    Serial.println("btn4");
    delay(500L);
    }  
  else if (Button5 == LOW){
    //delay(500L);
    Serial.println("btn5");
    delay(500L);
    } 
  else {
    //Serial.println("No button pressed");
    //delay(1000);
  }
}
