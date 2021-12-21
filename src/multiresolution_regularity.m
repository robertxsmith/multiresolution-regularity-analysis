function entropy = multiresolution_regularity(signal, m, r, max_level, wavelet, wavelet_order)
% This function accepts a time series, and returns an entropy vector
%
%   Args
%       signal:        time series of values  
%       m:             max pattern length
%       r:             intrinsic signal level fraction for pattern match
%       max_level:     wavelet scale (scale power of 2)
%       wavelet:       wavelet filter 
%       wavelet_order: wavelet filter order

%   Returns
%       entropy:       vector of entropy values across wavelet scales:
%                      low (approximation) to high (detail) frequencey 
%                      (with the exception of D1 scale used for noise
%                      estimation)
%
% e.g. entropy = wavelet_scale_regularity(rand(1024,1), 3, .2, 5, 'Daubechies', 4)

% spacing between pattern elements 
lags = 2.^(max_level-(1:max_level)+1); 

% compute the stationary wavelet transform
[approx_coefs, detail_coefs] = swt(signal, max_level, wavelet, wavelet_order);
wave_coefs = [approx_coefs, detail_coefs];

% adjust distance threshold for noise
r_bayes = compute_thresholds( wave_coefs , r); 

entropy = zeros(max_level,1);
for level = 1:max_level

    % m-length patterns
    patterns = construct_lagged_patterns( wave_coefs(:,level) , m, lags(level) );

    % compute Sample Entropy using vectorized approach
    entropy(level) = compute_entropy_vectorized( patterns, m, r_bayes(level) );
end
