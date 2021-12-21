function preprocessed_signal = preprocess(signal)
% This function performs basic signal preprocessing (mean centering,
% zero-padding)
%
%   Args
%       signal: time series of values  
%
%   Returns
%       preprocessed_signal: time series of values, preprocessed
%

% center signal
signal_length = length(signal);
preprocessed_signal = signal-mean(signal);
    

% Wavelet decomposition requires signal with power-of-2 length
pow_of_2 = nextpow2(length(preprocessed_signal));
if signal_length ~= 2^pow_of_2
    signal_padded = zeros(2^pow_of_2,1);
    signal_padded(1:signal_length) = preprocessed_signal;
    preprocessed_signal = signal_padded;
end
    

