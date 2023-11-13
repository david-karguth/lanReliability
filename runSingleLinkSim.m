%% Function runSingleLinkSim()
% Parameters:
%	K - The number of packets in the application message
%	p - The probability of failure
%	N - The number of simulations to run
%
% Returns: The average numeric result across the total simulations

function result = runSingleLinkSim(K, p, N)
	simResults = ones(1, N); 	% A place to store the result of each simulation
	for i = 1 : N
		txAttemptCount = 0;	% Transmission count
		pktSuccessCount = 0;	% Number of packets that have made it across
		while pktSuccessCount < K
			r = rand; % gen random number to determine if packet is successful (r > p)
			txAttemptCount = txAttemptCount + 1; % count first attempt
			while r < p % while packet transmission is not successful (r < p)
				r = rand; %transmit again, generate new success check value 'r'
				txAttemptCount = txAttemptCount + 1;  % Count additional attempt
			end
			pktSuccessCount = pktSuccessCount + 1; % increase success count after success (r > p)
		end
		simResults(i) = txAttemptCount; %record total number of attempted transmission befor eentire application message (K successful packets) transmitted
	end
	result = mean(simResults);
end

