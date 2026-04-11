%% Markov Chain HW 7, Prob 2
% Cooper Wark
clear all; clc; close all;

% c)
T = 48; % Min
lam = 3; % /min

% Generate RV, generate extras
UA = rand(1,2*T*lam);
UB = rand(1,2*T*lam);

% Time intervals b/w
interA = -log(UA)/lam;
interB = -log(UB)/lam;

% Time of score
timesA = cumsum(interA);
timesB = cumsum(interB);
% Only goals before end of game
timesA = timesA(timesA <= T);
timesB = timesB(timesB <= T);

% Plot
figure(); hold on;
for i = 1:length(timesA)
    A = line([timesA(i) timesA(i)],[0.5 1],Color='r');
end
for i = 1:length(timesB)
    B = line([timesB(i) timesB(i)],[0 0.5],Color='b');
end
xlabel("Time in Game (min)");
ylabel("Teams");
title("Goals Scored For Team A and B Over Game, Separate Processes");
legend([A,B],"Goals by A","Goals by B");
xlim([0 T]);

% d)
combLam = 2*lam;
U = rand(1,2*T*combLam);
interU = -log(U)/combLam;
timesComb = cumsum(interU);
timesComb = timesComb(timesComb <= T);

% Pick A or B score
% 0 or 1 size of comb times
Ascore = rand(size(timesComb)) < 0.5;
Acomb = timesComb(Ascore);
Bcomb = timesComb(~Ascore);

% Plot
figure(); hold on;
for i = 1:length(Acomb)
    A = line([Acomb(i) Acomb(i)],[0.5 1],Color='r');
end
for i = 1:length(Bcomb)
    B = line([Bcomb(i) Bcomb(i)],[0 0.5],Color='b');
end
xlabel("Time in Game (min)");
ylabel("Teams");
title("Goals Scored For Team A and B Over Game, 1 Process");
legend([A,B],"Goals by A","Goals by B");
xlim([0 T]);

% e)
N = 1e5;
totmean = 2*lam*T; % Tot exp
Ntot = round(totmean + sqrt(totmean)*randn(1,N));

% Split Team A + B, normal dist so randn
NA = round((Ntot*0.5) + sqrt(Ntot*0.25).*randn(1,N));
NB = Ntot - NA;
D = 2*(NA-NB); % Difference

% Sim vals
simExp = mean(D);
simVar = var(D);
estP0 = mean(D==0);

% Calc Vals
calcExp = 0;
calcVar = 8*lam*T;
calcP0 = 1/sqrt(4*pi*lam*T);