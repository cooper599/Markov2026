% Markov Chain HW 6, Prob 1
% Cooper Wark
clc; clear all; close all;

S = [0 1 2 3 4];
sd = [1/12;1/4;1/3;1/4;1/12]; % Stationary Distribution
X0 = 2;
q0 = [0 0 1 0 0]; 
n = 50;
P = [0 1 0 0 0;
     1/3 0 2/3 0 0;
     0 1/2 0 1/2 0;
     0 0 2/3 0 1/3;
     0 0 0 1 0];
qn = q0 * P^n;

figure(); hold on;
bar(S-0.05,qn,0.1);
bar(S+0.05,sd,0.1);
xlabel("State");
ylabel("Probability");
title("q_{50} vs \pi");
legend("q_{50}","\pi");
xticks(0:4);
xlim([-0.5 4.5]);