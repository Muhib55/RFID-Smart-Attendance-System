# RFID Attendance System

This project is an efficient and automated attendance tracking system using Radio-Frequency Identification (RFID) technology. It utilizes Arduino Uno for hardware interfacing and MATLAB for data processing, providing a seamless and accurate attendance monitoring solution.

## Requirements

- Arduino Uno
- RFID reader
- Computer with MATLAB installed
- MySQL database (for storing attendance records)

## Setup Instructions

### Arduino Setup

- Connect the RFID reader to the Arduino Uno.
- Upload the provided Arduino code (`arduino_rfid_reader.ino`) to the Arduino Uno using the Arduino IDE.

### MATLAB Setup

- Open MATLAB on your computer.
- Set up serial communication with Arduino:
  - Connect the Arduino Uno to the computer via USB.
  - Determine the COM port assigned to the Arduino Uno (e.g., COM3).
  - Update the COM port in the MATLAB code (`rfid_attendance_system.m`) accordingly.
- Set up MySQL database:
  - Create a MySQL database named `attendance_db`.
  - Create a table named `attendance` with columns: `tag_id`, `status`, and `timestamp`.
  - Update the database connection details (username, password) in the MATLAB code (`rfid_attendance_system.m`) to match your MySQL setup.

## Running the Project

- Open MATLAB and navigate to the directory containing the MATLAB code (`rfid_attendance_system.m`).
- Run the MATLAB code by typing the following command in the MATLAB command window:

```matlab
rfid_attendance_system
```
The system will start reading RFID tag IDs and updating attendance records in real-time. Attendance information will be displayed in the MATLAB command window.
## Troubleshooting
If you encounter any issues with serial communication or database connectivity, double-check the COM port settings and database connection details in the MATLAB code.
