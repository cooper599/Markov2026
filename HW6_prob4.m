% Markov HW 6 prob 4
% Cooper Wark
clear all; clc; close all;

% Estimate prob of extinc, frac extinct before 200 generations
N = 10^3; % Num avalanches
a = 0.49;
max_gens = 200;
num_extinct = 0;

% Outer loop for num trials
for i = 1:N
    Xn = 1; % Starting pop
    % Inner loop for generations up to max
    for gen = 1:max_gens
        if Xn == 0
            num_extinct = num_extinct + 1; % Add to extinction counter
            break; % Exit back to new trial, current trial went extinct
        end
        % Num reproducing particles
        Zn = binornd(Xn,1-a);
        % Each produces 2 particles
        Xn = 2*Zn; % Xn+1 = 2Zn
    end
end

Pextinct_sim = num_extinct/N; % Fraction extinct before 200 generations
Pextinct_acc = a/(1-a); % Approx 0.961
