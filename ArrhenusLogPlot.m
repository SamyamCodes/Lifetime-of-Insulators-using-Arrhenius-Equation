L0 = 20000; 
Theta0 = 130 + 273.15; 
B = 5000; 

T_C = 90:5:180; 
Theta_i = T_C + 273.15; 

L = L0 .* exp(B .* (1 ./ Theta_i - 1 ./ Theta0));

disp('Temperature (°C)    Lifetime (hrs)');
for i = 1:length(T_C)
    fprintf('%12.2f %16.2f\n', T_C(i), L(i));
end

fprintf('Lifetime at 130°C: %.2f hours\n', L(T_C == 130));

figure;

subplot(2, 1, 1);
plot(T_C, L, 'bo-', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Temperature (°C)', 'FontSize', 12);
ylabel('Insulation Lifetime (hours)', 'FontSize', 12);
title('Insulation Lifetime vs Temperature for Class B Insulation', 'FontSize', 14);
grid on;

subplot(2, 1, 2);
plot(T_C, log10(L), 'bo-', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('Temperature (°C)', 'FontSize', 12);
ylabel('Log_{10}(Insulation Lifetime)', 'FontSize', 12);
title('Logarithmic Insulation Lifetime vs Temperature for Class B Insulation', 'FontSize', 14);
grid on;

for i = 1:length(T_C)
    if mod(i, 2) == 0
        text(T_C(i), L(i), sprintf('%.1f', L(i)), ...
            'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 10, 'Color', 'b');
        text(T_C(i), log10(L(i)), sprintf('%.1f', log10(L(i))), ...
            'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 10, 'Color', 'b');
    end
end
