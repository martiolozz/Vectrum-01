const int analogPinA = A0;
int a;

const int analogPinB = A1;
int b;

const int analogPinC = A2;
int c;

const int analogPinD = A3;
int d;

const int analogPinE = A4;
int e;

const int ledPIN = 9;

int aMap;
int bMap;
int cMap;


#define Pecho 6
#define Ptrig 7
long duracion, distancia;

String dato;

void setup() {
  Serial.begin(9600);
  pinMode(Pecho, INPUT);
  pinMode(Ptrig, OUTPUT);
  pinMode(13,INPUT);
  pinMode(12,INPUT);
  pinMode(ledPIN , OUTPUT);
}

void loop() {

  

  int puerto=digitalRead(13);

  int puertoDos=digitalRead(12);

  if (puertoDos == 1)
{
  digitalWrite(ledPIN , HIGH);
  delay(500);
  digitalWrite(ledPIN , LOW);
}
else
{
  digitalWrite(ledPIN , LOW);
}
 

  a = analogRead(analogPinA);
  aMap = map(a, 0, 1023, 0, 255);

  b = analogRead(analogPinB);
  bMap = map(b, 0, 1023, 0, 255);


  c = analogRead(analogPinC);
  cMap = map(c, 0, 1023, 0, 255);


  d = analogRead(analogPinD);
  

  e = analogRead(analogPinE);
  


  digitalWrite(Ptrig, LOW);
  delayMicroseconds(2);
  digitalWrite(Ptrig, HIGH);
  delayMicroseconds(10);
  digitalWrite(Ptrig, LOW);

  duracion = pulseIn(Pecho, HIGH);
  distancia = (duracion/2) / 29;
  
/*
  if(distancia >= 500 || distancia <= 0){
      //Serial.println("0 > DISTANCIA || DISTANCIA > 500");
    }
    else{
      //Serial.print(distancia);
      //Serial.println("cm");
      //delay(500);
      }
   */
      
  dato = "";
  dato += puerto;
  dato += ",";
  dato += puertoDos;
  dato += ",";
  dato += distancia;
  dato += ",";
  dato += aMap;
  dato += ",";
  dato += bMap;
  dato += ",";
  dato += cMap;
  dato += ",";
  dato += d;
  dato += ",";
  dato += e;
  Serial.println(dato);
  delay(500);
}
