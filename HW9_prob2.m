% Markov Chain Hw 9 Prob 4
% Cooper Wark
clear all; clc; close all;

beta = 1; % easy beta val comp
maxm = 5000; % max particles

mvals = 1:maxm; % array 1-> m max
exp_tau_sto = zeros(1,maxm);
tdet = zeros(1,maxm);

for m = 1:maxm
    if m == 1
        exp_tau_sto(m) = 0; % t to 1 part when start at 1 0
    else
        karr = 1:(m-1);
        exp_tau_sto(m) = sum(1./(karr*beta)); % summation term to max m
    end
    tdet(m) = log(m)/beta;
end

figure(); hold on;
plot(mvals,exp_tau_sto,lineWidth=2);
plot(mvals,tdet,lineWidth = 2);
xlabel("m vals");
ylabel("Exp Time \tau_m");
title("Comparison of Stochastic vs Deterministic Expected Time");
legend("Stochastic","Deterministic");