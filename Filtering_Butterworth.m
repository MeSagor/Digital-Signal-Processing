clc; clear all; close all;

f1 = 100;
f2 = 200;

N = 150;
fs = 2000;
tsamp = 0 : 1/fs: (N-1)/fs;

% Noisy Signal generating....
signal = sin(2 * pi * f1 * tsamp) + sin(2 * pi * f2 * tsamp);
noisy_Signal = signal + (-1.5 + (3 * rand(1, length(signal))));

% DFT Calculating...
dft_of_noisy_signal = fft(noisy_Signal);
freq_axis = linspace(0, fs, length(noisy_Signal));

% Filtering....
wn = [95 205]/(fs/2);  % All frequency between 95 to 205 will be passed
[b, a] = butter(2, wn);
filtered_signal = filtfilt(b, a, noisy_Signal);


% Ploting....
subplot(3,1,1)
plot(tsamp, signal, DisplayName='Original Signal');
hold on;
plot(tsamp, noisy_Signal, LineWidth=1, DisplayName='Noisy Signal');
title('Signal')
legend;

subplot(3,1,2);
plot(freq_axis, abs(dft_of_noisy_signal), 'r');
title('DFT of Noisy Signal');
xlabel('Frequency(bins)');

subplot(3,1,3)
plot(tsamp,filtered_signal, LineWidth=1);
title('Filtered Signal');


