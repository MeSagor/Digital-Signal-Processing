clc; clear all; close all;

f = 5;
fs = 100;
tsamp = 0: 1/fs : 3/f - 1/fs;

x = sin(2 * pi * f * tsamp);

dft_x = DFT_Calculate(x);
  
shift = 10;
X = zeros(1, length(dft_x));
for k = 1 : length(dft_x)
   X(k) = X(k) + dft_x(k) * exp(-1j * 2 * pi * (k-1) * shift / length(dft_x));
end

restore = IDFT_Calculate(X);

subplot(311);
title('Input Signal');
stem(x);

subplot(312);
title('DFT of Input Signal');
stem(abs(dft_x));

subplot(313);
stem(x);
hold on;
stem(restore);



% Function for DFT calculation...
function [y] = DFT_Calculate(input)
    dft_size = length(input);
    y = zeros(1, dft_size);

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