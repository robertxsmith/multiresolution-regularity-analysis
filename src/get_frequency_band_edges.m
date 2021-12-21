function frequency_edges = get_frequency_band_edges(sample_rate, max_level)
% Compute Sample Entropy 
% Inputs
%   sample_rate:  temporal spacing (repetition time) 
%   max_level:    highest wavelet scale
%
% Outputs
%   frequency_edges - frequency band edges of wavelet scales 

nyquist_freq    = 1/(2*sample_rate);
frequency_edges = [0, nyquist_freq ./ 2.^(max_level:-1:0)];

