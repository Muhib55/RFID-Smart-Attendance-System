#include <SoftwareSerial.h>

SoftwareSerial RFID(2, 3); // RX and TX pins for RFID reader
String tagID = "";

void setup() {
  Serial.begin(9600); // Start serial communication with computer
  RFID.begin(9600); // Start RFID reader
}

void loop() {
  if (RFID.available() > 0) {
    char character = RFID.read();
    if (character == '\n') {
      // End of tag ID
      processTagID(tagID);
      tagID = ""; // Clear tagID for the next read
    } else {
      // Append character to tagID
      tagID += character;
    }
  }
}

void processTagID(String tag) {
  // Send tag ID to MATLAB via serial communication
  Serial.println(tag);
  delay(100);
}
