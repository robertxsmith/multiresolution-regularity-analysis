function patterns = construct_lagged_patterns(signal, patt_len, lag )
% This function constructs temporal patterns from an input time series
%
%   inputs: 
%       signal:   a 1-D numerical array
%       patt_len: maximum pattern length
%       lag:      number of points to skip until before next pattern element
%
%   Returns:
%       patterns: array of m-length patterns 


L               = length(signal);
lagged_patt_len = (patt_len-1)*lag+1;
num_patts       = L - lagged_patt_len + 1;

patterns = zeros(patt_len,num_patts);
for i = 0:patt_len-1
    patterns(i+1,:)= signal(1 + i*lag : num_patts + i*lag);
end