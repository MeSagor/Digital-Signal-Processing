clc; close all; clear all;

t = 0 : 0.001 : 1;  % discrete time
f = 10; % frequency(hz)

% almost continious signal
xCont = sin(2 * pi * f * t);
plot(t, xCont, DisplayName='Continuous wave');
hold on;
legend;

% Sampling
fs = 13;     % sampling frequency(hz)
tsamp = 0 : 1/fs : 1;

% sampled signal
xSamp = sin(2 * pi * f * tsamp);

plot(tsamp,xSamp,"b--o",LineWidth=2, DisplayName='Sampled wave');
hold on;


% checking for aliasing

if fs < 2 * f
    going = 1;
    i = 0;
    while(going)
        f_alias = abs(f - (i * fs));
        if f_alias <= fs/2
            going = 0;
        else
            i = i+1;
        end
    end

    if fs > f
        alias_signal = sin(2 * pi * f_alias * t + pi);
    else
        alias_signal = sin(2 * pi * f_alias * t);
    end

    plot(t, alias_signal, 'r', LineWidth=1, DisplayName='Aliased wave');
    title(['Aliased Frequency ' num2str(f_alias) 'Hz']);
else
    title("No Alising");
end

