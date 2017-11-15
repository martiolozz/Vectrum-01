import processing.serial.*;

Serial myPort;

float t = 0;

int grabando = 0;
int encendido = 0;
int a = 0;
int b = 0;
int puntos = 0;
int n1 = 0;

int r = 0;
int g = 0;
int c = 0;


String datoEntra = "";

void setup(){
  fullScreen();
  //size (900, 900);
  noFill();
  strokeWeight(2);
  noCursor();
  
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
}



void draw(){
  
  while(myPort.available() > 0){
    datoEntra = myPort.readStringUntil(10);
    
    if(datoEntra != null){
    
      println(datoEntra);
      
    String[] datos = split(datoEntra, ',');
      
      encendido = int(datos[0]);
      
      grabando = int(datos[1]);
      
      
      
      if(encendido == 1){
        
      r = int(datos[3]);
      
      g = int(datos[4]);
      
      c = int(datos[5]);
      
      a = int(datos[2]);
      
      b = a;
      
      println("r: "+ r);
      
      println("g: "+ g);
      
      println("b: "+ c);
      
      println("a: "+ a);
      
      puntos = int(datos[6]);
      
      t = float(datos[7]);
      
      println("t: "+ t);
      
      println("m: "+ puntos);
      
      n1 = int(datos[5]);
      }else{
        
        a = 0;
        b = 0;
        puntos = 0;
      }
      
      
    }
  }
  
  background(0);
  
  
  translate(width/2, height/2);
  
  beginShape();
  
  //stroke(int(random(2,200)), int(random(2,150)), int(random(2,100)));
  stroke(r,g,c);
  for (float theta = 0; theta <= 2 * PI; theta += 0.001){
    float rad = r(theta,
      a / 100.0,   //size
      b / 100.0,   //b
      puntos,   //puntos
      1,   //n1
      sin(t),   //n2
      cos(t)   //n3
    );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x,y);
  }

  
  endShape();
  
  t += t;
  
}

float r (float theta, float a, float b, float m, float n1, float n2, float n3) {
return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
}