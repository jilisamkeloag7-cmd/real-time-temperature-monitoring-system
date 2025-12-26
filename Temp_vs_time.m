clear all;
global a;

% Create Arduino object
a = arduino();

% Define parameters
interv = 500; 
init_time = 1; 
x_voltage = []; 
x_temperature = []; % Initialize empty array for temperature readings
time_vector = []; % Initialize empty array for time readings

% Loop to read voltage and temperature
while (init_time <= interv)

    voltage = readVoltage(a, 'A1'); % Read the input voltage from the Analog 1 port
    x_voltage = [x_voltage, voltage]; % Append the new voltage reading

    % Convert voltage to temperature in Celsius
    temperature = voltage / 0.01; % Convert mV to °C (10 mV per °C)
    x_temperature = [x_temperature, temperature]; % Append the new temperature reading

    % Record the time
    time_vector = [time_vector, init_time]; % Append the current time

    % Plot temperature vs. time
    plot(time_vector, x_temperature, 'b-'); 
    grid on; 
    xlabel('Time (s)'); 
    ylabel('Temperature (°C)'); 
    title('Temperature vs Time'); 
    drawnow;

    pause(1); % Wait for 1 second before the next reading
    init_time = init_time + 1; % Increment time
end