% MATLAB code for RFID attendance system

% Set up serial communication with Arduino
serialPort = serial('COM3', 'BaudRate', 9600); % Adjust COM port as needed
fopen(serialPort);

% Create MySQL database connection
conn = database('attendance_db', 'username', 'password');

% Main loop for reading RFID tag IDs
while true
    if serialPort.BytesAvailable > 0
        tagID = fscanf(serialPort, '%s'); % Read tag ID from Arduino
        % Process tag ID and update attendance records
        updateAttendance(conn, tagID);
        
        % Display real-time attendance information
        displayAttendance(conn);
    end
end

% Close serial port and database connection
fclose(serialPort);
close(conn);

% Function to update attendance records
function updateAttendance(conn, tagID)
    % Check if tagID already exists in database
    query = sprintf("SELECT * FROM attendance WHERE tag_id = '%s'", tagID);
    data = fetch(conn, query);
    if isempty(data)
        % Tag ID not found, insert new record
        insertQuery = sprintf("INSERT INTO attendance (tag_id, status, timestamp) VALUES ('%s', 'present', NOW())", tagID);
        exec(conn, insertQuery);
    else
        % Tag ID already exists, update existing record
        updateQuery = sprintf("UPDATE attendance SET status = 'present', timestamp = NOW() WHERE tag_id = '%s'", tagID);
        exec(conn, updateQuery);
    end
end

% Function to display real-time attendance information
function displayAttendance(conn)
    % Retrieve attendance data from database
    query = "SELECT * FROM attendance";
    data = fetch(conn, query);
    
    % Display attendance information
    disp("Real-time Attendance:");
    disp(data);
end
