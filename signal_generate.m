clc; close all; clear all;

% Unit impulse signal
t1 = -20:20;
start_point_impulse = 0;
impulse = (t1 - start_point_impulse == 0);
subplot(311);
stem(t1, impulse, 'LineWidth',1);
title('Unit Impulse Signal');

% Unit step signal;
t2 = -20:20;
start_point_step = 0;
unit_step = (t2 - start_point_step >= 0);
subplot(312);
stem(t2, unit_step, 'LineWidth',1);
title('Unit Step Signal');

% Unit ramp signal;
t3 = -20:20;
start_point_ramp = 0;
unit_ramp = t3 .* (t3 - start_point_ramp >= 0);
subplot(313);
stem(t3, unit_ramp, 'LineWidth',1);
title('Unit Ramp Signal');
