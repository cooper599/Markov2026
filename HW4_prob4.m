%% Markov Chain HW4, Problem 4
% Cooper Wark
clear all; clc; close all;

a = 0.25;
b = 0.4;
c = 1-a-b;

n = 0:0.5:20;
x0 = 0.5;

xn = x0.*c.^n;

figure();
plot(n,xn);
xlabel("n");
ylabel("Xn");
title("Xn vs n Showing Exponential Decay");