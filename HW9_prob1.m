% Markov Chain Hw 9, Prob 1
% Cooper Wark
clear all; clc; close all;

alpha =  1;
beta = 1;
L = 20;
N = 1000;

del_times = zeros(1,N);

for i = 1:N
    x = 0; % initial pos
    t = 0; % initial time
    while x < L
        if x == 0
            R = alpha; % reflects fprward
        else
            R = alpha + beta;
        end
        
        % Time to jump
        u1 = 1 - rand;
        dt = -log(u1)/R; % inverse solve exp dist
        t = t + dt;

        if x == 0
            x = x + 1; % moves forward
        else
            % move forward prob alpha/alpha + beta
            if rand < (alpha/R)
                x = x + 1;
            else
                x = x - 1;
            end
        end
    end
    del_times(i) = t; % tot time
end
tavg = mean(del_times);
tvar = var(del_times);
theoravg = L*(L+1)/(2*alpha);