%% Markov Chain HW1
% Cooper Wark
clear all; clc; close all;

% Transformed function
f = @(u) u.^4./(1+u.^6);

Iexact = integral(f,0,1); % Exact area under curve

xvals = 1:0.1:5;
Nvals = floor(10.^xvals); % Num points

E = zeros(size(Nvals)); % pre allocate

% Loop through all N vals
for i = 1:length(Nvals)
    N = Nvals(i);

    % Random points [0,1]^2
    u = rand(N,1);
    v = rand(N,1);

    % Points under curve calc
    fu = f(u);
    under = v <= fu; % check if v vals under f(u) vals (true or false/1 or 0)
    E(i) = sum(under) / N; % Fraction of values under function (sum of true/tot number N)
end

figure(); hold on;
semilogx(Nvals, E,'b',lineWidth=2);
yline(Iexact,'r',LineWidth=2);
xlabel("N Points (Log Scale)");
ylabel("Monte Carlo Estimate E(N)");
title("Monte Carlo Estimation of \int_1^\infty 1/(1+x^6) dx");
legend("Monte Carlo Estimate", "Actual", Location = "best");
