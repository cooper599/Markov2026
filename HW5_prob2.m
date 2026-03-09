%% Markov Chain HW 5, Problem 2
% Cooper Wark
clear all; clc; close all;

a = 0.04;
b = 0.16;
K = 0.1;
S = [1,2,3,4,5];
P = zeros(5,5); % Prob transition matrix

for i = 1:4
    % Calculating p1,p2,...,p4 values
    p(i) = K*exp(a*i);
    % Calculating q2,q3,...,q5.
    q(i) = K*exp(b*i);
end
% Diagonals
diagcomps = [1-p(1),1-p(2)-q(1),1-p(3)-q(2),1-p(4)-q(3),1-q(4)];
P = diag(diagcomps); % Adding diagonals
P = P + diag(p,1) + diag(q,-1); % Adding p's and q's

% b) Finding SD
[V,D] = eig(P');
% Eigenvalue closest to 1
[~,idx] = min(abs(diag(D)-1));
pivec = V(:,idx); % Take 4th row
pivec = abs(pivec)/sum(abs(pivec)); % Normalizing

% Part c, histogram of 10^6 steps
steps = 10^6;
current_state = 1;
counts = zeros(1,5);

for i = 1:steps
    counts(current_state) = counts(current_state) + 1; % Add 1 to current state
    probs = P(current_state,:);
    % Numberline setup
    cum_probs = cumsum(probs);
    r = rand(); % Generate random number
    % Check spot on line, checks 1st value r is leq to and returns
    next_state = find(r <= cum_probs,1,"first");
    current_state = next_state;
end
sim_dist = counts / steps; % Normalizing

% Plotting
figure();
bar(sim_dist);
xlabel("State Number");
ylabel("Fraction Time Spent In State")
title("Fraction of Time Spent In Specific State");

% Part d, combined histogram
% Calculating Expression values from (a)
detbal_theory = zeros(1,5);
% Normalization calc den
den = 0;
for j = 1:5
    den = den + exp((a-b)*(j-1)*j/2);
end
for i = 1:5
    num = exp((a-b)*(i-1)*i/2);
    detbal_theory(i) = num/den;
end
% Combining data for plotting
data = zeros(3,5);
for i = 1:5
    data(i,1) = sim_dist(i);
    data(i,2) = detbal_theory(i);
    data(i,3) = pivec(i);
end
% Plotting
figure(); hold on;
bar(data);
xlabel("State Number");
ylabel("Fraction of Time in State");
title("Comparison of Simulation vs Theoretical Fraction of Time Spent In States");
legend("Simulation (c)","Detailed Balance Theoretical (a)","Stationary Distribution Theoretical (b)");
x = 1:5;
xticks(x);