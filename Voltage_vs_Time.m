clear all;
global a;

% Create Arduino object
a = arduino();

% Define parameters
interv = 500; 
init_time = 1; 
x_voltage = []; 
time_vector = []; % Initialize empty array for time readings

% Loop to read voltage and temperature
while (init_time <= interv)

    voltage = readVoltage(a, 'A1');% Read the input voltage from the Analog 1 port 
    x_voltage = [x_voltage, voltage]; % Append the new voltage reading

    
    % Record the time
    time_vector = [time_vector, init_time]; % Append the current time

    % Plot temperature vs. time
    plot(time_vector, x_voltage, 'b-'); 
    grid on; 
    xlabel('Time (s)'); 
    ylabel('Voltage (V)'); 
    title('Voltage vs Time'); 
    drawnow;

    pause(1); % Wait for 1 second before the next reading
    init_time = init_time + 1; % Increment time
end