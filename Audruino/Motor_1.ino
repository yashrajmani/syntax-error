#include <SoftwareSerial.h>

SoftwareSerial mySerial(10, 9); // RX, TX pins for GSM900 module
String message;

void setup() {
  // initialize serial communication with Arduino and GSM900 module
  Serial.begin(9600);
  mySerial.begin(9600);

  // configure GSM900 module for text mode
  mySerial.println("AT+CMGF=1");

  // set the phone number to receive messages
  mySerial.println("AT+CNMI=2,2,0,0,0");
}

void loop() {
  // check if a new message is received
  if (mySerial.available() > 0) {
    message = mySerial.readString();
    Serial.println(message);

    // check if the message is "Hello"
    if (message.indexOf("OFF") >= 0) {
      // send reply "Hi"
      digitalWrite(3,LOW);
       
      mySerial.println("AT+CMGS=\"+917564954597\""); // replace with the phone number to send message
      delay(1000);
      mySerial.print("Turned Off");
      delay(100);
      mySerial.write(26); // end message with Ctrl+Z
      Serial.println("Reply sent");
     
    }

    if (message.indexOf("ON") >= 0) {
      // send reply "Hi"
     // digitalWrite(,HIGH);
       
      mySerial.println("AT+CMGS=\"+917564954597\""); // replace with the phone number to send message
      delay(1000);
      mySerial.print("Turned On");
      delay(100);
      mySerial.write(26); // end message with Ctrl+Z
      Serial.println("Reply sent");
     }
  }
}
