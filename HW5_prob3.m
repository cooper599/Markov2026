%% Markov Chain HW 5, Problem 3
% Cooper Wark
clear all; clc; close all;

a = 0.99;
P = [1-a a 0; a 0 1-a; 0 1-a a];

% Getting Eigenvalues and Vectors
[V,D] = eig(P);
q0 = [1;0;0];
c = V \ q0;
q10 = V*(D^10)*c;
q100 = V*(D^100)*c;
% Plot Showing covergence to SD exponentially
N = 500;
q = zeros(N,3);
for i = 1:N
    temp = V*(D^i)*c;
    q(i,1) = temp(1);
    q(i,2) = temp(2);
    q(i,3) = temp(3);
end
n = 1:1:N;
figure();
subplot(2,1,1);
plot(n,q);
xlabel("n");
ylabel("q_n");
title("q_n vs n Showing Convergence to SD as n to \infty")
legend("q_n(1)","q_n(2)","q_n(3)");
% Plot of only q_n(3) for visual ease
subplot(2,1,2);
plot(n,q(:,3),"Color",[0.9290, 0.6940, 0.1250]);
xlabel("n");
ylabel("q_n");
title("q_n(3) vs n Showing Convergence to SD as n to \infty")
legend("q_n(3)");

% Part e
a = 0.99;
N = [100,1000,10000];
nmax = 500;
fn = zeros(3,nmax + 1);
for i = 1:length(N)
    currentNcounts = zeros(1,nmax + 1);
    currentNcounts(1) = N(i); % n = 0 case starts in 1
    for ii = 1:N(i)
        current_state = 1; % Initialize state
        for iii = 1:nmax
            probs = P(current_state,:);
            % Combined logic from q2 into 1 line
            next_state = find(rand< cumsum(probs),1,"first");
            current_state = next_state;
            % Check if updated count needed
            if current_state == 1
                % iii + 1 to offset n = 0 for theoretical
                currentNcounts(iii+1) = currentNcounts(iii+1) + 1;
            end
        end
    end
    % Fraction calcs
    fn(i,:) = currentNcounts / N(i);
end

n = 0:nmax;
q1theor = zeros(size(n));

for i = 1:length(n)
    nval = n(i);
    qn = V * (D^nval) * c; % From part c w/ nmax = 500
    q1theor(i) = qn(1);
end

figure(); hold on;
% N = 100
subplot(3,1,1); hold on;
plot(n,fn(1,:));
plot(n,q1theor);
xlabel("n");
ylabel("Fraction of Time in State 1");
title("Simulation vs Theoretical Time Spent in State 1 for various n, N = 100");
legend("Simulation","Theoretical");
% N = 1000
subplot(3,1,2); hold on;
plot(n,fn(2,:));
plot(n,q1theor);
xlabel("n");
ylabel("Fraction of Time in State 1");
title("Simulation vs Theoretical Time Spent in State 1 for various n, N = 1000");
legend("Simulation","Theoretical");
% N = 10000
subplot(3,1,3); hold on;
plot(n,fn(3,:));
plot(n,q1theor);
xlabel("n");
ylabel("Fraction of Time in State 1");
title("Simulation vs Theoretical Time Spent in State 1 for various n, N = 10000");
legend("Simulation","Theoretical");