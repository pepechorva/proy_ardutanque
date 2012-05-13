
//MOTORES

int motor1Pin1 = 3;   // Motor 1 adelante
int motor1Pin2 = 4;   // Motor 1 atras
int speedPin1 = 9;    // Motor 1 aceleracion (PWM) Pin enable del L293

int motor2Pin1 = 5;   // Motor 2 adelante
int motor2Pin2 = 6;   // Motor 2 atras
int speedPin2 = 10;   // Motor 2 aceleracion (PWM) Pin Enable del L293

//SENSOR DISTANCIA



//OTROS

int ledPin = 13;      // LED 
int speedpin = 0;     // tasa de velocidad a la que Arduino envia los datos




void setup() {
  
Serial.begin (9600);


// Control Motor 1
pinMode(motor1Pin1, OUTPUT); 
pinMode(motor1Pin2, OUTPUT); 
pinMode(speedPin1, OUTPUT);

//Control Motor 2
pinMode(motor2Pin1, OUTPUT); 
pinMode(motor2Pin2, OUTPUT); 
pinMode(speedPin2, OUTPUT);

pinMode(ledPin, OUTPUT);

// Establece speedPinX en modo High para poder controlar la velocidad
digitalWrite(speedPin1, HIGH);
digitalWrite(speedPin2, HIGH);

// comprobacion de reseteo, si el led parpadea solo 3 veces, todo esta bien
// si vuelve a parpadear, significa que ha hecho un reset, revisar conexiones
// por si hubiera un corto
blink(ledPin, 3, 100);
}

void loop() {

  //Si el switch no esta pulsado, gira en una direccion, si no en la contraria
  if (digitalRead(switchPin) >0) {
    
    digitalWrite(motor1Pin1, LOW);      // Establece el sentido de giro del motor 1
    digitalWrite(motor1Pin2, HIGH);     // 
    
    speedpin = analogRead(potPin);      // Lectura del valor del potenciometro
    speedpin = 800 + (speedpin/6);      // Para establecer la velocidad de giro
    analogWrite (speedPin1, speedpin);  //
    Serial.print("motor 1 = ");         //
    Serial.println(speedpin);           //
    delay (50);                         //
    
    
    digitalWrite(motor2Pin1, LOW);      // Establece el sentido de giro del motor 2
    digitalWrite(motor2Pin2, HIGH);     // 
    
    speedpin = analogRead(potPin2);     // Lectura del valor del potenciometro
    speedpin = 800 + (speedpin/6);      // Para establecer la velocidad de giro
    analogWrite (speedPin2, speedpin);  //
    Serial.print("motor 2 = ");         //
    Serial.println(speedpin);           //
    delay(50);                          //
  }  
  else {
    digitalWrite(motor1Pin1, HIGH);     // Establece el sentido de giro del motor 1
    digitalWrite(motor1Pin2, LOW);      // 
    
    speedpin = analogRead(potPin);      // Lectura del valor del potenciometro
    speedpin = 800 + (speedpin/6);      // Para establecer la velocidad de giro
    analogWrite (speedPin1, speedpin);  //
    Serial.print("motor 1 = ");         //
    Serial.println(speedpin);           //
    delay (50);                         //
    
    
    digitalWrite(motor2Pin1, HIGH);     // Establece el sentido de giro del motor 2
    digitalWrite(motor2Pin2, LOW);      // 
    
    speedpin = analogRead(potPin2);     // Lectura del valor del potenciometro
    speedpin = 800 + (speedpin/6);      // Para establecer la velocidad de giro
    analogWrite (speedPin2, speedpin);  //
    Serial.print("motor 2 = ");         //
    Serial.println(speedpin);           //
    delay(50);                          //
  }
}

/*
Parpadeo del led, Significa que ha ejecutado la funcion setup()
si todo va bien, solo parpadea tres veces, si hay algun error que resetee el arduino,
volvera a verse el parpadeo del led
*/
void blink(int whatPin, int howManyTimes, int milliSecs) {
  int i = 0;
  for ( i = 0; i < howManyTimes; i++) {
    digitalWrite(whatPin, HIGH);
    delay(milliSecs/2);
    digitalWrite(whatPin, LOW);
    delay(milliSecs/2);
  }
}

