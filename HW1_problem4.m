%% Markov Chain HW, Problem 4
% Cooper Wark
clear all; clc; close all;

% Number of trials
N = 10^5;

% Random Arrivals Array
tarrive = rand(N,3);

% Check T when all arrived
T = max(tarrive,[],2);

% Theoretical pdf from part a
t = linspace(0,1,N); % t span
pdf = 3*t.^2;

% Plotting Histogram of Theoretical vs Random
figure(); hold on;
histogram(T,"normalization","pdf");
plot(t,pdf,lineWidth=2);
xlabel("Time Since 6 PM (Hours)");
ylabel("PDF");
title("Comparison of Histogram vs PDF of Time Until All Friends Arrive");