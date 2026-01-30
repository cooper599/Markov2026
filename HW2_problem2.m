%% Markov Chain HW2, Problem 2
% Cooper Wark
clear all; clc; close all;

%% Method 1, Inverse + Newton's Method
N = 10^6; % Number of runs
u = rand(1,N); % Random variables U ~ U(0,1)
x = zeros(1,N); % Preallocate x array

% Bounds for exmax loops on Newton's Method
maxIter = 50;

% Newton-Raphson Method x_k+1 = x_k + f(x_k)/f'(x_k)
tic
for i = 1:N
    ui = u(i);
    x0 = -log(1-ui); % x0 > 0
    
    for k = 1:maxIter
        f = 1 - exp(-x0)*(x0+1) - ui;
        fprime = x0*exp(-x0);
        x0 = x0 - f/fprime;
    end

    x(i) = x0;
end
t1 = toc

%% Method 2, Acceptance Rejection
c = 4/exp(1);

X = zeros(N,1); % Preallocate accepted values
count = 0; % Keep track of how many accepted

tic
while count < N
    Y = -2*log(rand); % 1) Sample Exponential dist
    U = rand; % 2)Generate U ~ U(0,1)
    % 3) Check if accepted
    accepted = 2*Y*exp(-Y/2)/(4/exp(1)); % f(x)/cg(x)
    % If accepted return
    if U < accepted
        count = count + 1;
        X(count) = Y;
    end
end
t2 = toc

%% Method 3, Sum of Exponentials
tic
% Exponentials distributions
E1 = -log(rand(1,N));
E2 = -log(rand(1,N));
X_sum = E1 + E2; % Sum of both
t3 = toc

%% Part e, Histogram Comparison
tempx = linspace(0,max(X_sum),1e5);
theor = tempx.*exp(-tempx); % Theoretical gamma dist.

figure(); hold on;
histogram(X_sum,"Normalization","pdf");
plot(tempx,theor,LineWidth=2);
xlabel("x");
ylabel("PDF");
title("X ~ Gamma(2,1) Sampling vs Theoretical");
legend("Sum of Exponential Sampling","Theoretical");