%% Markov Chain HW3, Problem 3
% Cooper Wark
clear all; clc; close all;

% Transition prob matrix
P = [1 0 0 0 0;
     1/3 0 2/3 0 0;
     0 1/3 0 2/3 0;
     0 0 1/3 0 2/3;
     0 0 0 0 1];

P_4 = P^4;