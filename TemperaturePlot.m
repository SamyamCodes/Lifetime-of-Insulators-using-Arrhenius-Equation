% Time specifications
total_time = 3600; % Total time in seconds (60 minutes)
steady_state_time = 93; % Initial steady-state time in seconds
transient_start = steady_state_time; % When the transient starts
sampling_rate = 1; % 1 sample per second
t = 0:sampling_rate:total_time; % Time vector

% Initial steady-state temperature
T_steady_state = 83; % Temperature during steady state

% Temperature oscillation base details
T_min_base = 103; % Base minimum temperature during transient operation
T_max_base = 130; % Changed to 130 for maximum temperature
oscillation_period = 600; % Time period for one oscillation (in seconds)

% Amount of random fluctuation around the base temperatures
fluctuation_range = 5; % Adjust as necessary for more/less variation

% Generate the temperature waveform (initial steady-state)
T = T_steady_state * ones(size(t)); % Initialize with steady-state temperature

% Function for triangular wave generation with fluctuating peaks
for i = 1:length(t)
    if t(i) > transient_start
        % Time since transient started
        time_since_start = t(i) - transient_start;
        % Randomize the min and max values for this oscillation
        T_min = T_min_base + randn * fluctuation_range;
        T_max = T_max_base + randn * fluctuation_range;
        % Create a triangular wave with fluctuating peak values
        T(i) = T_min + (T_max - T_min) * abs(mod(time_since_start, oscillation_period) / (oscillation_period / 2) - 1);
    end
end

% Plot the temperature waveform for FBGD only
figure;
plot(t, T, 'm', 'LineWidth', 1.5); % FBGD waveform in magenta

% Add labels and title
xlabel('Time [Sec]');
ylabel('Temperature [°C]');
title('Measured temperatures, Class B');

grid on;
