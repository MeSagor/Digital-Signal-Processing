clc; close all; clear all;

t = -30:30;
raw_inputSignal = sin(pi * t/10)./(pi * t/10);
raw_inputSignal(t==0) = 1;

raw_impulseSignal = [zeros(1,3),ones(1,8), zeros(1,3)];
%
% subplot(2,1,1);
% plot(raw_inputSignal);
% subplot(2,1,2);
% plot(raw_impulseSignal);


% raw_inputSignal=[1 1.1 1.2 2.1 0.4 3.5 2.5 2.1 2.7 3.1];
% raw_impulseSignal = [1,1,1,1,1];


raw_input_len = length(raw_inputSignal);
raw_impulse_len = length(raw_impulseSignal);
convolution_size = raw_input_len + raw_impulse_len - 1;

% making the length of input & impluse signal same
inputSignal = [raw_inputSignal, zeros(1, raw_impulse_len)];
impulseSignal = [raw_impulseSignal, zeros(1, raw_input_len)];

outputSignal = zeros(1, convolution_size);

% Convolution operations using for loop
for n = 1 : convolution_size
    for k = 1 : n
        outputSignal(n) = outputSignal(n) + (inputSignal(k) * impulseSignal(n - k + 1));
    end
end

% function generated convolution
fun_gen_outputSignal = conv(raw_inputSignal, raw_impulseSignal);


% Ploting.....

subplot(3,2,1);
stem(raw_inputSignal);
% plot(inputSignal, LineWidth=1);
title('Input Signal');
grid on;

subplot(3,2,2);
stem(raw_impulseSignal);
% plot(impluseSignal, LineWidth=1);
title('Impulse Signal');
grid on;

subplot(3,2,[3,4]);
stem(outputSignal);
% plot(outputSignal, LineWidth=1);
title('Convoluted Output Signal');
grid on;

subplot(3,2,[5,6]);
stem(fun_gen_outputSignal);
% plot(outputSignal2, LineWidth=1);
title('Convoluted Output Signal (function generated)');
grid on;



