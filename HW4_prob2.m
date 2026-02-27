%% Markov Chain HW4, Problem 2
% Cooper Wark
clear all; clc; close all;

n = 5; % Number of machines
p = 0.9; % Prob still working
q = 0.1; % Prob machines breaks down

% Creating probability transition matrix
P = zeros(n+1,n+1);
P(1,6) = 1; % Adding P05 prob

for i = 2:(n+1)
    machleft = i - 1;
    for j = 1:i
        endmach = j-1;
        k = endmach; % Ending machines
        m = machleft; % Number of machines
        P(i,j) = nchoosek(m,k) * (p^k) * q^(m-k); % Prob per transition Pij
    end
end

P;

P^500; % check for long run pi calculation