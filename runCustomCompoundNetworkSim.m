%% Function runTwoSeriesLinkSim()
% Parameters:
%	K - The number of packets in the application message
%	p1 - The probability of failure of link 1
%	p2 - The probability of failure of link 2
%	p3 - The probability of failure of link 3
%	N - The number of simulations to run
%
% Returns: The average numeric result across the total simulations

function result = runCustomCompoundNetworkSim(K, p1, p2, p3, N)
	simResults = ones(1, N); 	% A place to store the result of each simulation
	for i = 1 : N
		txAttemptCount = 0;		% Transmission count
		pktSuccessCount = 0;	% Number of packets that have made it across
		while pktSuccessCount < K
			r1 = rand; 			% gen random number to determine if packet is successful (r1 > p1)
			r2 = rand; 			% gen random number to determine if packet is successful (r2 > p2)
			r3 = rand; 			% gen random number to determine if packet is successful (r3 > p3)
			txAttemptCount = txAttemptCount + 1; % count first attempt
			while (r1 < p1) && (r2 < p2) 		% while packet transmission is not successful (r1 < p1 and r2 < p2)
				r1 = rand; 		% transmit again, generate new success check value 'r1'
				r2 = rand; 		% transmit again, generate new success check value 'r2'
				txAttemptCount = txAttemptCount + 1;  % Count additional attempt
			end
			while r3 < p3 		% while packet transmission is not successful (r3 < p3)
				r3 = rand; 		% transmit again, generate new success check value 'r3'
				txAttemptCount = txAttemptCount + 1;  % Count additional attempt
			end
			pktSuccessCount = pktSuccessCount + 1; % increase success count after success (r > p)
		end
		simResults(i) = txAttemptCount; %record total number of attempted transmission befor eentire application message (K successful packets) transmitted
	end
	result = mean(simResults);
end

