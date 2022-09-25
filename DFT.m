clc; clear all; close all;

f1 = 1000;
A1 = 3;
f2 = 2000;
A2 = 5;

% Sampling...
N = 30;
fs = 6000;
tsamp = 0 : 1/fs : (N-1)/fs;   % N data points

% Signal Generate...
signal = A1 * sin(2 * pi * f1 * tsamp) + A2 * sin(2 * pi * f2 * tsamp + (3*pi)/4) + 4*rand(1, N);

% Custom DFT calculating....
N_point_DFT = length(signal);
dft = DFT_Calculate(signal, N_point_DFT);

% DFT calculating by FFT...
dft_fft = fft(signal, N_point_DFT);

% Custom Inverse DFT calculating..
idft = IDFT_Calculate(dft);

% % Dynamic range setup for y-axis...
% dft = dft * 2/length(signal);

% Frequency range setup for x-axis...
freq = linspace(0, fs , N_point_DFT);

% Ploting...
subplot(4,2,[1,2]);
plot(tsamp, signal, '-o', LineWidth=1);
title("Input Signal")
xlabel("Data points")

subplot(423);
stem(freq, abs(dft), LineWidth=1);
title("DFT value")
xlabel("Frequency")

subplot(424);
stem(freq, angle(dft), LineWidth=1);
title("DFT Phase")

subplot(425);
stem(freq, abs(dft_fft), LineWidth=1);
title("DFT value by FFT")
xlabel("Frequency")

subplot(426);
stem(freq, angle(dft_fft), LineWidth=1);
title("DFT Phase by FFT")

subplot(4,2,[7,8]);
plot(tsamp, idft, 'r-o', LineWidth=1);
title("Re-Construct Signal")
xlabel("Data points")



% Function for DFT calculation...
function [y] = DFT_Calculate(input, dft_size)
    input_len = length(input);
    if(dft_size < input_len)
        error('DFT size must be greater than or equal to input length');
    end

    input = [input, zeros(1, dft_size - input_len)];
    y = zeros(1, dft_size, "double" );

    for k = 1 : dft_size
        for n = 1 : dft_size
            y(k) = y(k) + (input(n) * exp(-1j * 2 * pi * (k-1) * (n-1)/dft_size));
        end
    end
end


% Function for Inverse-DFT calculation...
function [y] = IDFT_Calculate(input_dft)
    idft_size = length(input_dft);
    y = zeros(1, idft_size);

    for n = 1 : idft_size
        for k = 1 : idft_size
            y(n) = y(n) + (input_dft(k) * exp(1j * 2 * pi * (k-1) * (n-1)/idft_size));
        end
    end
    y = (1/idft_size) * real(y);
end
