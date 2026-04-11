% Markov Chain Hw 7, Problem 1
% Cooper Wark
clear all; clc; close all;

% Summation for a) P(A win)
N = 10; % Num terms
PAwin = 0;
for i = 1:N
    Agoals = exp(-2)*2^i/factorial(i);
    sumB = 0;
    for ii = 0:(i-1)
        Bgoals = exp(-1.5)*1.5^ii/factorial(ii);
        sumB = sumB + Bgoals;
    end
    PAwin = PAwin + Agoals*sumB;
end

% Part b) Tie at end when 0-0 at time t
Ttot = 90;
ts = linspace(0,90,1000);
Ptie = zeros(1,length(ts)); % preallocate tie probs at time t

% Outer loop for each t
for i = 1:length(ts)
    t = ts(i);
    tau = Ttot - t;

    uA = 2*tau/90;
    uB = 1.5*tau/90;

    Ptiecurr = 0;
    N = 10; % Summation terms
    % Inner loop for summation at each t
    for ii = 0:N
        probA = exp(-uA)*uA^ii/factorial(ii);
        probB = exp(-uB)*uB^ii/factorial(ii);
        Ptiecurr = Ptiecurr + probA*probB;
    end
    Ptie(i) = Ptiecurr;
end

figure();
plot(ts,Ptie);
xlabel("Time (min)");
ylabel("Probability of Tie at End of Game");
title("Probability of Game Ending in Tie vs t Passed (Given 0-0 at time t)");

% Part c) Tie at end when 1-0 at t = 60 min
Ttot = 90;
ts = linspace(0,90,1000);
Ptie = zeros(1,length(ts)); % preallocate tie probs at time t

% Outer loop for each t
for i = 1:length(ts)
    t = ts(i);
    tau = Ttot - t;

    uA = 2*tau/90;
    uB = 1.5*tau/90;

    Ptiecurr = 0;
    N = 10; % Summation terms
    % Inner loop for summation at each t
    if t < 60 % if goal hasn't been scored yet
        for ii = 0:N
            probA = exp(-uA)*uA^ii/factorial(ii);
            probB = exp(-uB)*uB^ii/factorial(ii);
            Ptiecurr = Ptiecurr + probA*probB;
        end
    else % if goal has been score, B needs to score 1 more than A in remaining time
        for iii = 0:N
            probA = exp(-uA)*uA^iii/factorial(iii);
            probB = exp(-uB)*uB^(iii+1)/factorial(iii+1);
            Ptiecurr = Ptiecurr + probA*probB;
        end
    end
    Ptie(i) = Ptiecurr;
end

figure(); hold on;
plot(ts,Ptie);
xline(60,'--r'); % Goal at 60 min
xlabel("Time (min)");
ylabel("Probability of Tie at End of Game");
title("Probability of Game Ending in Tie vs t Passed (Given 0-0 at time t)");
legend("Prob Game Ending As a Tie","Goal at 60 min");
ylim([0 1]);