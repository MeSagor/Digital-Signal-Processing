clc; close all; clear all;

% Equation have to implement...
% yCoff[0]*y[n] + yCoff[1]*y[n-1] + yCoff[2]*y[n-2] + ... = xCoff[0]*x[n] + xCoff[1]*x[n-1] ...
% Find y[n] = ?


input_data = zeros(1,10);
% input_data(1) = 1;

y_cofficient = [1 -1 -1];
x_cofficient = [0 0];

% initial value/values of y
initial_condition = [0 1];

% using build-in function
yn_function_generated = filter(x_cofficient,y_cofficient,input_data);

% using my function
yn = myFilter(x_cofficient, y_cofficient, input_data, initial_condition);

subplot(4,1,1)
% plot(input_data);
stem(input_data);
title('Input data');
grid on;

subplot(4,1,[2,3]);
% plot(yy, LineWidth=1);
stem(yn);
title('Custom calculated');
grid on;

subplot(4,1,4);
% plot(y, LineWidth=1);
stem(yn_function_generated);
title('Function generated');
grid on;


% My Function
function [y] = myFilter(xCoff, yCoff, input_data, initial_condition)
    xCoff_len = length(xCoff);
    yCoff_len = length(yCoff);
    xCoff = [xCoff, zeros(1, length(input_data) - xCoff_len)];
    yCoff = [yCoff, zeros(1, length(input_data) - yCoff_len)];

    output_size = length(xCoff);
    y = zeros(1, max(output_size, length(initial_condition)));
    for i = 1 : length(initial_condition)
        y(i) = initial_condition(i);
    end

    for n = length(initial_condition)+1 : length(y)
        y_sum = 0;
        x_sum = 0;
        for j = 2 : n
            y_sum = y_sum + (yCoff(j) * y(n - j + 1));
        end
        for j = 1 : n
            x_sum = x_sum + (xCoff(j) * input_data(n - j + 1));
        end
        y(n) = (x_sum - y_sum)/yCoff(1);
    end
end
