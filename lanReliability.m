%% Lan Reliability Project
% David Karguth
% 11/12/2023

%% Workspace Initialization
close all;
clear all;
clc;

%% Define constants
p_Array = 0 : 0.01 : 0.99; 	% All possible values of 'p' from 0% to 100% except 100% because this is a scam
k_Array = [1, 5, 15, 50, 100];	% Number of packets to send
N = 1000;					% Iterations to run each time

%% Task 1

simValues = zeros(length(k_Array), length(p_Array));
calcValues = simValues;

for i = 1 : 5				% Number of 'k' values in the array
	K = k_Array(i);
	for j = 1 : 100			% Number of 'p' values in the array
		p = p_Array(j);
		simValues(i, j) = runSingleLinkSim(K, p, N);	% Run the single link simulation
		calcValues(i, j) = K / (1 - p);					% Calculated the expected result
	end
end

% Plots
K = 1;
figure();
semilogy(p_Array, calcValues(1, :), 'bo');
hold on;
semilogy(p_Array, simValues(1, :), 'color', 'm');
title("Average Transmissions, K = 1");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("Calc", "Sim");
hold off;

K = 5;
figure();
semilogy(p_Array, calcValues(2, :), 'bo');
hold on;
semilogy(p_Array, simValues(2, :), 'color', 'm');
title("Average Transmissions, K = 4");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("Calc", "Sim");
hold off;

K = 15;
figure();
semilogy(p_Array, calcValues(3, :), 'bo');
hold on;
semilogy(p_Array, simValues(3, :), 'color', 'm');
title("Average Transmissions, K = 15");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("Calc", "Sim");
hold off;

K = 50;
figure();
semilogy(p_Array, calcValues(4, :), 'bo');
hold on;
semilogy(p_Array, simValues(4, :), 'color', 'm');
title("Average Transmissions, K = 50");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("Calc", "Sim");
hold off;

K = 100;
figure();
semilogy(p_Array, calcValues(5, :), 'bo');
hold on;
semilogy(p_Array, simValues(5, :), 'color', 'm');
title("Average Transmissions, K = 100");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("Calc", "Sim");
hold off;


figure();
semilogy(p_Array, simValues(1, :), 'mo');
hold on;
semilogy(p_Array, simValues(2, :), 'bo');
semilogy(p_Array, simValues(3, :), 'yo');
semilogy(p_Array, simValues(4, :), 'ro');
semilogy(p_Array, simValues(5, :), 'go');
semilogy(p_Array, calcValues(1, :), 'color', 'k');
semilogy(p_Array, calcValues(2, :), 'color', 'k');
semilogy(p_Array, calcValues(3, :), 'color', 'k');
semilogy(p_Array, calcValues(4, :), 'color', 'k');
semilogy(p_Array, calcValues(5, :), 'color', 'k');

legend("K = 1", "K = 5", "K = 15", "K = 50", "K = 100");

%% Task 2

simValues = zeros(length(k_Array), length(p_Array));
calcValues = simValues;

for i = 1 : 5				% Number of 'k' values in the array
	K = k_Array(i);
	for j = 1 : 100			% Number of 'p' values in the array
		p = p_Array(j);
		simValues(i, j) = runTwoSeriesLinkSim(K, p, N);	% Run the series link simulation
		calcValues(i, j) = K / ((1 - p) * (1 - p));					% Calculated the expected result
	end
end

% Plots
K = 1;
figure();
semilogy(p_Array, calcValues(1, :), 'bo');
hold on;
semilogy(p_Array, simValues(1, :), 'color', 'm');
title("Average Transmissions, K = 1");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("Calc", "Sim");
hold off;

K = 5;
figure();
semilogy(p_Array, calcValues(2, :), 'bo');
hold on;
semilogy(p_Array, simValues(2, :), 'color', 'm');
title("Average Transmissions, K = 4");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("Calc", "Sim");
hold off;

K = 15;
figure();
semilogy(p_Array, calcValues(3, :), 'bo');
hold on;
semilogy(p_Array, simValues(3, :), 'color', 'm');
title("Average Transmissions, K = 15");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("Calc", "Sim");
hold off;

K = 50;
figure();
semilogy(p_Array, calcValues(4, :), 'bo');
hold on;
semilogy(p_Array, simValues(4, :), 'color', 'm');
title("Average Transmissions, K = 50");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("Calc", "Sim");
hold off;

K = 100;
figure();
semilogy(p_Array, calcValues(5, :), 'bo');
hold on;
semilogy(p_Array, simValues(5, :), 'color', 'm');
title("Average Transmissions, K = 100");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("Calc", "Sim");
hold off;


figure();
semilogy(p_Array, simValues(1, :), 'mo');
hold on;
semilogy(p_Array, simValues(2, :), 'bo');
semilogy(p_Array, simValues(3, :), 'yo');
semilogy(p_Array, simValues(4, :), 'ro');
semilogy(p_Array, simValues(5, :), 'go');
semilogy(p_Array, calcValues(1, :), 'color', 'k');
semilogy(p_Array, calcValues(2, :), 'color', 'k');
semilogy(p_Array, calcValues(3, :), 'color', 'k');
semilogy(p_Array, calcValues(4, :), 'color', 'k');
semilogy(p_Array, calcValues(5, :), 'color', 'k');

legend("K = 1", "K = 5", "K = 15", "K = 50", "K = 100");

%% Task 3

simValues = zeros(length(k_Array), length(p_Array));
calcValues = simValues;

for i = 1 : 5				% Number of 'k' values in the array
	K = k_Array(i);
	for j = 1 : 100			% Number of 'p' values in the array
		p = p_Array(j);
		simValues(i, j) = runTwoParallelLinkSim(K, p, N);	% Run the parallel link simulation
	end
end

% Plots
K = 1;
figure();
semilogy(p_Array, simValues(1, :), 'color', 'm');
hold on;
title("Average Transmissions, K = 1");
ylabel("Transmissions");
xlabel("Probability of Failure");
hold off;

K = 5;
figure();
semilogy(p_Array, simValues(2, :), 'color', 'm');
hold on;
title("Average Transmissions, K = 4");
ylabel("Transmissions");
xlabel("Probability of Failure");
hold off;

K = 15;
figure();
semilogy(p_Array, simValues(3, :), 'color', 'm');
hold on;
title("Average Transmissions, K = 15");
ylabel("Transmissions");
xlabel("Probability of Failure");
hold off;

K = 50;
figure();
semilogy(p_Array, simValues(4, :), 'color', 'm');
hold on;
title("Average Transmissions, K = 50");
ylabel("Transmissions");
xlabel("Probability of Failure");
hold off;

K = 100;
figure();
semilogy(p_Array, simValues(5, :), 'color', 'm');
hold on;
title("Average Transmissions, K = 100");
ylabel("Transmissions");
xlabel("Probability of Failure");
hold off;


figure();
semilogy(p_Array, simValues(1, :), 'mo');
hold on;                               
semilogy(p_Array, simValues(2, :), 'bo');
semilogy(p_Array, simValues(3, :), 'yo');
semilogy(p_Array, simValues(4, :), 'ro');
semilogy(p_Array, simValues(5, :), 'go');
legend("K = 1", "K = 5", "K = 15", "K = 50", "K = 100");

%% Task 4

simValues = zeros(length(k_Array), length(p_Array));
calcValues = simValues;

for i = 1 : 5				% Number of 'k' values in the array
	K = k_Array(i);
	for j = 1 : 100			% Number of 'p' values in the array
		p = p_Array(j);
		simValues(i, j) = runCompoundNetworkSim(K, p, N);	% Run the parallel link simulation
	end
end

% Plots
K = 1;
figure();
semilogy(p_Array, simValues(1, :), 'color', 'm');
hold on;
title("Average Transmissions, K = 1");
ylabel("Transmissions");
xlabel("Probability of Failure");
hold off;

K = 5;
figure();
semilogy(p_Array, simValues(2, :), 'color', 'm');
hold on;
title("Average Transmissions, K = 4");
ylabel("Transmissions");
xlabel("Probability of Failure");
hold off;

K = 15;
figure();
semilogy(p_Array, simValues(3, :), 'color', 'm');
hold on;
title("Average Transmissions, K = 15");
ylabel("Transmissions");
xlabel("Probability of Failure");
hold off;

K = 50;
figure();
semilogy(p_Array, simValues(4, :), 'color', 'm');
hold on;
title("Average Transmissions, K = 50");
ylabel("Transmissions");
xlabel("Probability of Failure");
hold off;

K = 100;
figure();
semilogy(p_Array, simValues(5, :), 'color', 'm');
hold on;
title("Average Transmissions, K = 100");
ylabel("Transmissions");
xlabel("Probability of Failure");
hold off;


figure();
semilogy(p_Array, simValues(1, :), 'mo');
hold on;                               
semilogy(p_Array, simValues(2, :), 'bo');
semilogy(p_Array, simValues(3, :), 'yo');
semilogy(p_Array, simValues(4, :), 'ro');
semilogy(p_Array, simValues(5, :), 'go');
legend("K = 1", "K = 5", "K = 15", "K = 50", "K = 100");

%% Task 5
% Part 1

k_Array = [1, 5, 10];
p1 = 0.1;
p2 = 0.6;
p3_Array = 0 : 0.01 : 0.99;
N = 1000;
simValues = zeros(3, 100);

for i = 1 : 3
	K = k_Array(i);
	for j = 1 : 100
		p3 = p3_Array(j);
		simValues(i, j) = runCustomCompoundNetworkSim(K, p1, p2, p3, N);
	end
end

figure();
semilogy(p3_Array, simValues(1, :), 'ro');
hold on;                                
semilogy(p3_Array, simValues(2, :), 'go');
semilogy(p3_Array, simValues(3, :), 'bo');
title("Average Transmissions");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("K = 1", "K = 5", "K = 10");

% Part 2

k_Array = [1, 5, 10];
p1 = 0.6;
p2 = 0.1;
p3_Array = 0 : 0.01 : 0.99;
N = 1000;
simValues = zeros(3, 100);

for i = 1 : 3
	K = k_Array(i);
	for j = 1 : 100
		p3 = p3_Array(j);
		simValues(i, j) = runCustomCompoundNetworkSim(K, p1, p2, p3, N);
	end
end

figure();
semilogy(p3_Array, simValues(1, :), 'ro');
hold on;                              
semilogy(p3_Array, simValues(2, :), 'go');
semilogy(p3_Array, simValues(3, :), 'bo');
title("Average Transmissions");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("K = 1", "K = 5", "K = 10");

% Part 3

k_Array = [1, 5, 10];
p1 = 0.1;
p3 = 0.6;
p2_Array = 0 : 0.01 : 0.99;
N = 1000;
simValues = zeros(3, 100);

for i = 1 : 3
	K = k_Array(i);
	for j = 1 : 100
		p2 = p2_Array(j);
		simValues(i, j) = runCustomCompoundNetworkSim(K, p1, p2, p3, N);
	end
end

figure();
semilogy(p2_Array, simValues(1, :), 'ro');
hold on;
semilogy(p2_Array, simValues(2, :), 'go');
semilogy(p2_Array, simValues(3, :), 'bo');
title("Average Transmissions");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("K = 1", "K = 5", "K = 10");

% Part 4

k_Array = [1, 5, 10];
p1 = 0.6;
p3 = 0.1;
p2_Array = 0 : 0.01 : 0.99;
N = 1000;
simValues = zeros(3, 100);

for i = 1 : 3
	K = k_Array(i);
	for j = 1 : 100
		p2 = p2_Array(j);
		simValues(i, j) = runCustomCompoundNetworkSim(K, p1, p2, p3, N);
	end
end

figure();
semilogy(p2_Array, simValues(1, :),'ro');
hold on;
semilogy(p2_Array, simValues(2, :), 'go');
semilogy(p2_Array, simValues(3, :), 'bo') ;
title("Average Transmissions");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("K = 1", "K = 5", "K = 10");

% Part 5

k_Array = [1, 5, 10];
p3 = 0.6;
p2 = 0.1;
p1_Array = 0 : 0.01 : 0.99;
N = 1000;
simValues = zeros(3, 100);

for i = 1 : 3
	K = k_Array(i);
	for j = 1 : 100
		p1 = p1_Array(j);
		simValues(i, j) = runCustomCompoundNetworkSim(K, p1, p2, p3, N);
	end
end

figure();
semilogy(p1_Array, simValues(1, :), 'ro');
hold on;
semilogy(p1_Array, simValues(2, :), 'go');
semilogy(p1_Array, simValues(3, :), 'bo');
title("Average Transmissions");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("K = 1", "K = 5", "K = 10");

% Part 6

k_Array = [1, 5, 10];
p3 = 0.1;
p2 = 0.6;
p1_Array = 0 : 0.01 : 0.99;
N = 1000;
simValues = zeros(3, 100);

for i = 1 : 3
	K = k_Array(i);
	for j = 1 : 100
		p1 = p1_Array(j);
		simValues(i, j) = runCustomCompoundNetworkSim(K, p1, p2, p3, N);
	end
end

figure();
semilogy(p1_Array, simValues(1, :), 'ro');
hold on;
semilogy(p1_Array, simValues(2, :), 'go');
semilogy(p1_Array, simValues(3, :), 'bo');
title("Average Transmissions");
ylabel("Transmissions");
xlabel("Probability of Failure");
legend("K = 1", "K = 5", "K = 10");
