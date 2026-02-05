%% Markov Chain HW3, Problem 4
% Cooper Wark
clear all; clc; close all;

P = [0.5 0.5 0 0 0 0;
     0 0.5 0.5 0 0 0;
     1/3 0 1/3 1/3 0 0;
     0 0 0 0.5 0.5 0;
     0 0 0 0 0 1;
     0 0 0 0 1 0];

P_5 = P^5;

% Simulation
N = 10000;
num_4s = 0;

% 10 000 Loop
for i = 1:N
    state = 1;
    % 5 Step loop
    for ii = 1:5
        % Same numberline cumul probs
        u = rand;
        p1 = P(state,1);
        p2 = p1 + P(state,2);
        p3 = p2 + P(state,3);
        p4 = p3 + P(state,4);
        p5 = p4 + P(state,5);
        % Transitions
        if u <= p1
            state = 1;
        elseif u <= p2
            state = 2;
        elseif u <= p3
            state = 3;
        elseif u <= p4
            state = 4;
        elseif u <= p5
            state = 5;
        else
            state = 6;
        end
    end
    if state == 4
        num_4s = num_4s + 1;
    end
end
frac4s = num_4s/N;