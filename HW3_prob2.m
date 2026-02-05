%% Markov Chain HW3, Problem 2
% Cooper Wark
clear all; clc; close all;

% Transition Prob Matrix P
P = [0.9 0.1 0;0 7/8 1/8; 2/5 0 3/5];

% Computing P^50
P_50 = P^50;

% Simulation starting in G, 10 000 Steps
N = 10000;
state = 1; % G: 1, S: 2, D: 3
Gs = 0; % Initial number of Gs

for i = 1:N
    % State G counter
    if state == 1
        Gs = Gs + 1;
    end
    % Transtion
    u = rand;
    p1 = P(state,1); % First threshold
    p2 = p1 + P(state,2); % Second threshold

    % "Number lines" to check prob of transitioning
    if u <= p1 
        state = 1;
    elseif u <= p2
        state = 2;
    else
        state = 3;
    end
end

fracG = Gs/N;