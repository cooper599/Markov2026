%% Markov Chain HW4, Problem 1
% Cooper Wark
clear all; clc; close all;

q = 0.4;
p = 0.35;
s = 0.25;
N = 100000;
initmoney = 10;

endmoney = zeros(1,N);
for i = 1:N
    money = initmoney;
    while money > 0
        u = rand;
        if u < s % if retiring
            break;
        elseif u < s + p % if win
            money = money + 1;
        else % if lose
            money = money - 1;
        end
    end
    endmoney(i) = money;
end
% Expected from sim
mean(endmoney)

% Expected from eq
rroot = (1-sqrt(1-4*p*q))/2;
Ei10 = initmoney + (p-q)/s * (1-rroot^i)