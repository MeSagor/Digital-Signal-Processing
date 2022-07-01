clc; close all; clear all;

t = 0: 0.001 : 1;
f = 2;

% almost continious signal
waveCont = 10 * sin(2 * pi * f * t) + 20 * sin(2 * pi * 2*f * t);
plot(t, waveCont, LineWidth=1, DisplayName='Continuous wave');
hold on;
ylabel('Amplitude');
xlabel('Sampling');
grid on;
legend;

% Sampling
fs = 30;
tsamp = 0: 1/fs: 1;

% sampled signal
waveSamp =  10 * sin(2 * pi * f * tsamp) + 20 * sin(2 * pi * 2*f * tsamp);

plot(tsamp, waveSamp, "r--o", LineWidth=1, DisplayName='Sampled wave');
hold on;

% Quantization
nBits = 2;
qLevels = 2^(nBits);

yMin = min(waveSamp);
yMax = max(waveSamp);

scalingFactor = round((yMax - yMin)/qLevels);

waveSamp_Quant = waveSamp/scalingFactor;
waveSamp_Quant = round(waveSamp_Quant);
waveSamp_Quant = waveSamp_Quant * scalingFactor;


plot(tsamp, waveSamp_Quant, LineWidth=1, DisplayName='Quantized Wave');

