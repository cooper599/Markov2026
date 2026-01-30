%% Markov Chain HW2, Problem 1
% Cooper Wark
clear all; clc; close all;

% Variables
gam = 4;
x0 = 10;

N1 = 100;
N2 = 1000;
N3 = 10000;

% Inverse CDF
function val = inverse(x0,gam,u)
    % u: input array from U ~ U(0,1)
    val = x0.*(1-u).^(1/(1-gam));
end

% Random Variables from U ~ U(0,1)
x1 = rand(1,N1);
x2 = rand(1,N2);
x3 = rand(1,N3);

fx1 = inverse(x0,gam,x1);
fx2 = inverse(x0,gam,x2);
fx3 = inverse(x0,gam,x3);

% Actual pdf
t = linspace(x0,60,1e5);
C = (gam-1)*x0^(gam-1);
pdf = C*t.^(-gam);

% Figures
% Figure 1, N = 100, N = 1000, N = 10000
figure(); 

subplot(2,2,1); hold on;
histogram(fx1,"Normalization","pdf",BinLimits=[0 60]);
histogram(fx2,"Normalization","pdf",BinLimits=[0 60]);
histogram(fx3,"Normalization","pdf",BinLimits=[0 60]);
plot(t,pdf,LineWidth=2);
title("Power Law Samples for Various N vs Theoretical Distribution");
xlabel("X");
ylabel("PDF");
legend("N = 100","N=1000","N=10000", "Theoretical Distribution");

subplot(2,2,2); hold on;
histogram(fx1,"Normalization","pdf",BinLimits=[0 60],FaceColor=[0 0.4470 0.7410]);
plot(t,pdf,LineWidth=2);
title("Power Law Samples for N = 100 vs Theoretical Distribution");
xlabel("X");
ylabel("PDF");
legend("N = 100","Theoretical Distribution");

subplot(2,2,3); hold on;
histogram(fx2,"Normalization","pdf",BinLimits=[0 60],FaceColor=[0.8500, 0.3250, 0.0980]);
plot(t,pdf,LineWidth=2);
title("Power Law Samples for N = 1000 vs Theoretical Distribution");
xlabel("X");
ylabel("PDF");
legend("N=1000","Theoretical Distribution");

subplot(2,2,4); hold on;
histogram(fx3,"Normalization","pdf",BinLimits=[0 60],FaceColor=[0.9290 0.6940 0.1250]);
plot(t,pdf,LineWidth=2);
title("Power Law Samples for N = 10000 vs Theoretical Distribution");
xlabel("X");
ylabel("PDF");
legend("N=10000", "Theoretical Distribution");