%% Markov Chain HW3, Problem 1
% Cooper Wark
clear all; clc; close all;

% plot of f(x), and c(a*)ga*(x)
x = linspace(0,10,1000);
a = sqrt(3) - 1;

f = (1/3).*x.*(1+x).*exp(1).^(-x); % f(x)

c = exp(1)^(-a)/(3*a^2*(1-a)); % c(a*)
g = a^2.*x.*exp(1).^(-a.*x); % ga*(x)
cg = c * g; % c(a*)ga*(x)

figure(); hold on;
plot(x,f);
plot(x,cg);
xlabel("x");
ylabel("PDF");
title("Acceptance Rejection Optimization")
legend("f(x)","c(a^*)g_{a^*}(x)")