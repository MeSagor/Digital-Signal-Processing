clc; close all; clear all;

% Signal-1
fs = 64;
tsamp = 0 : 1/fs : 1;
raw_first_signal = sin(2 * pi * 5 * tsamp);

% Signal-2
fs2 = 64;
tsamp2 = 0 : 1/fs2 : 1;
raw_second_signal = sin(2 * pi * 5 * tsamp2);


% raw_first_signal= [1,2,3,4,5];
% raw_second_signal = [1,2,3,4,5];


raw_first_signal_len = length(raw_first_signal);
raw_second_signal_len = length(raw_second_signal);
correlation_size = raw_first_signal_len + raw_second_signal_len - 1;

% making the length of two signal same
first_signal = [raw_first_signal, zeros(1, raw_second_signal_len)];
second_signal = [zeros(1, raw_first_signal_len), raw_second_signal];


outputSignal = zeros(1, correlation_size);
lag = zeros(1, correlation_size);

size = length(second_signal);
lag_value = raw_second_signal_len * (-1);

% Correlation operations using for loop
for n = 1 : correlation_size
    lag(n) = lag_value + 1;
    for k = 1 : n
        outputSignal(n) = outputSignal(n) + (first_signal(k) * second_signal(size - n + k));
    end
    lag_value = lag_value + 1;
end

% function generated Correlation
[fun_gen_outputSignal, lagg] = xcorr(raw_first_signal, raw_second_signal);


% Ploting.....

subplot(3,2,2);
% stem(raw_first_signal);
plot(raw_first_signal, "r--o", LineWidth=1);
title('First Signal');
grid on;
% plot(raw_second_signal, LineWidth=1);

subplot(3,2,1);
% stem(raw_second_signal);
plot(raw_second_signal,"b--o", LineWidth=1);
title('Second Signal');
grid on;

subplot(3,2,[3,4]);
% stem(outputSignal);
% % Normalized
% plot(lag ,outputSignal./max(abs(outputSignal)), LineWidth=1);
plot(lag ,outputSignal, LineWidth=1);
title('Correlation Output Signal');
xlabel('Lag');
grid on;

subplot(3,2,[5,6]);
% stem(fun_gen_outputSignal);
plot(lagg, fun_gen_outputSignal, LineWidth=1);
title('Correlation Output Signal (function generated)');
xlabel('Lag');
grid on;



