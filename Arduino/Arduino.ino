#include <Servo.h>

Servo myservoA;
Servo myservoB;
Servo myservoC;
Servo myservoD;
Servo myservoE;

char caractere;
String recu;

String STpos6;
String STposA;
String STposB;
String STposC;
String STpos2;
String STposD;
String Pince;
String STposE;

int pos6;
int posA = 90;
int posB = 90;
int posC = 90;
int posD = 60;
int posE = 110;
int pos2;

void setup()
{
  Serial.begin(9600);
  Serial.setTimeout(10);
  myservoA.attach(3);
  myservoA.write(90);
  myservoB.attach(4);
  myservoB.write(90); 
  myservoC.attach(5);
  myservoC.write(90);
  
  myservoD.attach(6);
  myservoD.write(60);

  myservoE.attach(2);
  myservoE.write(110);

  pinMode(9, OUTPUT);
}

void loop()
{

  while (Serial.available() > 0)
  {
    caractere = Serial.read();
    recu += caractere;
  }
  recu.trim();

  //Exemple: 000;000;000;000;O

  if (recu.length() >= 11)
  {
    STposA = recu.substring(0, 3);
    posA = STposA.toInt();
    posA = posA - 360;
    if(posA > 90)
    {
      posA = posA - (posA - 90)*2;
    }
    else
    {
      posA = posA + (90 - posA)*2;
    }
    myservoA.write(posA);

    STposB = recu.substring(4, 7);
    posB = STposB.toInt();
    posB = posB - 450;
    myservoB.write(posB);

    STposC = recu.substring(8, 11);
    posC = STposC.toInt();
    posC = posC - 360;
    if(posC > 90)
    {
      posC = posC - (posC - 90)*2;
    }
    else
    {
      posC = posC + (90 - posC)*2;
    }
    myservoC.write(posC);

    STposE = recu.substring(12, 15);
    posE = STposE.toInt();
    posE = posE - 360;
    myservoE.write(posE);


    Pince = recu.substring(16, 17);
    if(Pince == "O")
    {
      myservoD.write(60);
    }
    if(Pince == "F")
    {
      myservoD.write(200);
    }
  }
  
  

  Serial.println(recu + " OK !");

  
  delay(500);
  digitalWrite(9, HIGH);

  recu = "";
}
