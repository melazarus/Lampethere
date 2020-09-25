#include <ESP8266WiFi.h>
#include <WiFiUdp.h>
#include <FastLED.h>


WiFiUDP Udp;
unsigned int localUdpPort = 4210;

FASTLED_USING_NAMESPACE

// FastLED "100-lines-of-code" demo reel, showing just a few 
// of the kinds of animation patterns you can quickly and easily 
// compose using FastLED.  
//
// This example also shows one easy way to define multiple 
// animations patterns and have them automatically rotate.
//
// -Mark Kriegsman, December 2014

#if defined(FASTLED_VERSION) && (FASTLED_VERSION < 3001000)
#warning "Requires FastLED 3.1 or later; check github for latest code."
#endif

#define DATA_PIN    D3
//#define CLK_PIN   4
#define LED_TYPE    WS2811
#define COLOR_ORDER GRB
#define NUM_LEDS    4
CRGB leds[NUM_LEDS];
#define BRIGHTNESS          96



void setup() {
  // tell FastLED about the LED strip configuration
  FastLED.addLeds<LED_TYPE,DATA_PIN,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);
  
  // set master brightness control
  FastLED.setBrightness(BRIGHTNESS);
  FastLED.clear();  // clear all pixel data
  FastLED.show(); 
  delay(100);
    leds[0] = CRGB(255,0,0);
  FastLED.show(); 
  
  
  // put your setup code here, to run once:
  Serial.begin(9600);

    WiFi.begin("Frednet", "Aspire5920");

  Serial.print("Connecting");
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println();

  Serial.print("Connected, IP address: ");
  Serial.println(WiFi.localIP());

  Udp.begin(localUdpPort);

    delay(3000); // 3 second delay for recovery

   
    leds[0] = CRGB(0,255,0);
  FastLED.show(); 
 
}

int state = 0;

void loop() {
  int packetSize = Udp.parsePacket();
  if (packetSize)
  {
    Serial.printf("Received %d bytes from %s, port %d\n", packetSize, Udp.remoteIP().toString().c_str(), Udp.remotePort());

  if (!state){
  leds[2] = CRGB(0,0,255);
  leds[1] = CRGB(0,255,0);
  leds[0] = CRGB(255,0,0);
  state = 1;
  } else{
    FastLED.clear();  
    state = 0;
    }

  FastLED.delay(100); 
  FastLED.show();  

   }
}
