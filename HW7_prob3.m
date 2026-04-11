%% Markov Chain HW 7, Prob 3
% Cooper Wark
clear all; clc; close all;

% Num calc pt a
f = @(t) exp(-(0.5*t + (t.^3/5400)));
ET = integral(f,0,inf);

% Part c
lamMax = 0.5*(1+(120/30)^2);
T = 120;

lambda = @(t) 0.5*(1+(t/30).^2);

tcurr = 0;
potArr = [];
% Generate arrival Ts while time less than 120 Days
while tcurr < T
    dt = -log(rand())/lamMax; % Same as prob 2
    tcurr = tcurr + dt;
    % If valid put in potential arrivals array
    if tcurr <= T
        potArr = [potArr,tcurr];
    end
end
% Keep arrive Ti w/ prob lam(Ti)/lamMax
Udec = rand(size(potArr));
accProb = lambda(potArr)/lamMax;
% Accept Ts w/ prob, accept if random <= prob of acceptance
finalArr = potArr(Udec <= accProb);

% Create plot
figure();
histogram(finalArr,T)
xlabel("Days (t)");
ylabel("Reports per Day");
title("Reports per Day vs Days")

% Calc total number of reports
totRep = length(finalArr);