#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>

#define BNO055_SAMPLERATE_DELAY_MS (100)

Adafruit_BNO055 bno = Adafruit_BNO055(55);

float val;
int encoder0PinA = 3;
int encoder0PinB = 4;
int encoder0Pos = 0;
int encoder0PinALast = LOW;
int n = LOW;

volatile unsigned long leftCount = 0;
volatile unsigned long rightCount = 0;

int AIN_1 = 10;
int AIN_2 = 11;
int MAX_PWM_VOLTAGE = 255;

String inString = "";

void setup() 
{
  pinMode(AIN_1, OUTPUT);
  pinMode(AIN_2, OUTPUT);

  pinMode (encoder0PinA, INPUT);
  pinMode (encoder0PinB, INPUT);

  Serial.begin (9600);
  Serial.println("Orientation Sensor Test"); Serial.println("");
  if(!bno.begin())
  {
    /* There was a problem detecting the BNO055 ... check your connections */
    Serial.print("Ooops, no BNO055 detected ... Check your wiring or I2C ADDR!");
    while(1);
  }

  delay(50);

  /* Display some basic information on this sensor */
  displaySensorDetails();

  /* Optional: Display current status */
  displaySensorStatus();

  bno.setExtCrystalUse(true);
}
 
void loop() 
{ 
  sensors_event_t event;
  bno.getEvent(&event);

  /* Display the floating point data */
  
  Serial.print(event.orientation.x, 4);
  Serial.print(",");
  Serial.print(event.orientation.y, 4);
  Serial.print(",");
  Serial.print(event.orientation.z, 4);

  /* Optional: Display calibration status */
  

  /* Optional: Display sensor status (debug only) */
  //displaySensorStatus();

  /* New line for the next sample */
  Serial.println("");

  /* Wait the specified delay before requesting nex data */
  delay(BNO055_SAMPLERATE_DELAY_MS);
  n = digitalRead(encoder0PinA);
  if ((encoder0PinALast == LOW) && (n == HIGH)) 
  {
    if (digitalRead(encoder0PinB) == LOW) 
    {
      encoder0Pos--;
    } 
    else 
    {
      encoder0Pos++;
    }
    encoder0Pos = abs(encoder0Pos);
    
  }
  encoder0PinALast = n;
  while(1)
  {
    if(encoder0Pos<280)
  
      break;
  
    digitalWrite(AIN_2,1);
    
    analogWrite(AIN_1,255);
  
  }
  
  digitalWrite(AIN_2,0);
  
  digitalWrite(AIN_1,255);

  
  if (encoder0Pos == 805)
  {
    encoder0Pos = 0;
  }  
}

void displaySensorDetails(void)
{
  sensor_t sensor;
  bno.getSensor(&sensor);
  Serial.println("------------------------------------");
  Serial.print  ("Sensor:       "); Serial.println(sensor.name);
  Serial.print  ("Driver Ver:   "); Serial.println(sensor.version);
  Serial.print  ("Unique ID:    "); Serial.println(sensor.sensor_id);
  Serial.print  ("Max Value:    "); Serial.print(sensor.max_value); Serial.println(" xxx");
  Serial.print  ("Min Value:    "); Serial.print(sensor.min_value); Serial.println(" xxx");
  Serial.print  ("Resolution:   "); Serial.print(sensor.resolution); Serial.println(" xxx");
  Serial.println("------------------------------------");
  Serial.println("");
  delay(10);
}

void displaySensorStatus(void)
{
  /* Get the system status values (mostly for debugging purposes) */
  uint8_t system_status, self_test_results, system_error;
  system_status = self_test_results = system_error = 0;
  bno.getSystemStatus(&system_status, &self_test_results, &system_error);

  /* Display the results in the Serial Monitor */
  Serial.println("");
  Serial.print("System Status: 0x");
  Serial.println(system_status, HEX);
  Serial.print("Self Test:     0x");
  Serial.println(self_test_results, HEX);
  Serial.print("System Error:  0x");
  Serial.println(system_error, HEX);
  Serial.println("");
  delay(10);
}
void displayCalStatus(void)
{
  /* Get the four calibration values (0..3) */
  /* Any sensor data reporting 0 should be ignored, */
  /* 3 means 'fully calibrated" */
  uint8_t system, gyro, accel, mag;
  system = gyro = accel = mag = 0;
  bno.getCalibration(&system, &gyro, &accel, &mag);

  /* The data should be ignored until the system calibration is > 0 */
  Serial.print("\t");
  if (!system)
  {
    Serial.print("! ");
  }

  /* Display the individual values */
  Serial.print("Sys:");
  Serial.print(system, DEC);
  Serial.print(" G:");
  Serial.print(gyro, DEC);
  Serial.print(" A:");
  Serial.print(accel, DEC);
  Serial.print(" M:");
  Serial.print(mag, DEC);
}
