clc; close all; clear all;

t = 0: 0.01: 1; % discrete time
f = 4;  % frequency(hz)
a = 5;  % amplitude

signal = a * sin(2 * pi * f * t);

plot(t, signal);


