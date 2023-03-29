#include <SoftwareSerial.h>
SoftwareSerial SIM900A(10,11); //TX=10,RX=11
const int pingPin = 7; // Trigger Pin of Ultrasonic Sensor
const int echoPin = 6; // Echo Pin of Ultrasonic Sensor

void setup() {
Serial.begin(9600);
pinMode(3,OUTPUT);
SIM900A.begin(9600);
Serial.println ("SIM900A Ready");
delay(100);
//Serial.println ("Type s to send message or r to receive message");
}

void loop() {
  int sensorValue = analogRead(A0);
  long duration, inches, cm;
   pinMode(pingPin, OUTPUT);
   digitalWrite(pingPin, LOW);
   delayMicroseconds(2);
   digitalWrite(pingPin, HIGH);
   delayMicroseconds(10);
   digitalWrite(pingPin, LOW);
   pinMode(echoPin, INPUT);
   duration = pulseIn(echoPin, HIGH);
   inches = microsecondsToInches(duration);
   cm = microsecondsToCentimeters(duration);
  //Serial.println(sensorValue);
  if(sensorValue<1000 && cm<=5 )
  {
    Serial.println("Tank Full");
    SendMessage_Full();
    digitalWrite(3,HIGH); 
    delay(10000);
    
  }
  else
  {
    Serial.println("Tank not Full");
    //delay(10000);
    //SendMessage_cm(cm);
    digitalWrite(3,LOW);
  }
Serial.print(cm);
Serial.print("cms");
delay(10000);

 if (SIM900A.available()>0){
  RecieveMessage();
  if( SIM900A.read()=='c'){
    SendMessage_Test();
  }
 }
  
}


long microsecondsToCentimeters(long microseconds) {
   return microseconds / 29 / 2;
}

 void SendMessage_Full()
{
  Serial.println ("Sending Message");
  SIM900A.println("AT+CMGF=1");    //Sets the GSM Module in Text Mode
  delay(1000);
  Serial.println ("Set SMS Number");
  SIM900A.println("AT+CMGS=\"+917564954597\"\r"); //Mobile phone number to send message
  delay(1000);
  Serial.println ("Set SMS Content");
  SIM900A.println("OFF !!!");// Messsage content
  delay(100);
  //Serial.println ("Finish");
  SIM900A.println((char)26);// ASCII code of CTRL+Z
  delay(1000);
  Serial.println ("Message has been sent");
}

void SendMessage_cm(long cm)
{
  Serial.println ("Sending Message");
  SIM900A.println("AT+CMGF=1");    //Sets the GSM Module in Text Mode
  delay(1000);
  Serial.println ("Set SMS Number");
  SIM900A.println("AT+CMGS=\"+917564954597\"\r"); //Mobile phone number to send message
  delay(1000);
  Serial.println ("Set SMS Content");
  SIM900A.println(cm);// Messsage content
  delay(100);
  Serial.println ("Finish");
  SIM900A.println((char)26);// ASCII code of CTRL+Z
  delay(1000);
  Serial.println ("Message has been sent");
}
void SendMessage_Test()
{
  Serial.println ("Sending Message");
  SIM900A.println("AT+CMGF=1");    //Sets the GSM Module in Text Mode
  delay(1000);
  Serial.println ("Set SMS Number");
  SIM900A.println("AT+CMGS=\"+919693440630\"\r"); //Mobile phone number to send message
  delay(1000);
  Serial.println ("Set SMS Content");
  SIM900A.println("Test!!!");// Messsage content
  delay(100);
  Serial.println ("Finish");
  SIM900A.println((char)26);// ASCII code of CTRL+Z
  delay(1000);
  Serial.println ("Message has been sent");
}

 void RecieveMessage()
{
  Serial.println ("SIM900A receiving SMS");
  delay (1000);
  SIM900A.println("AT+CNMI=2,2,0,0,0"); // AT Command to receive a live SMS
  delay(1000);
  Serial.write ("Unread Message done");
 }

long microsecondsToInches(long microseconds) {
   return microseconds / 74 / 2;
}
