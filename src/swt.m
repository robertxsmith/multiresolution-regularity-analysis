function [approximation_coefficients, detail_coefficients] = swt(signal, max_level, wavelet, order)
% This function performs a forward stationary (e-decimated) wavelet transform
%
%   Args
%       signal: time series of values  
%       max_level: highest wavelet scale to transform
%       wavelet: type of wavelet filter to use (e.g. Haar, Daubechies)
%       wavelet_order: the order of the wavelet filter to use (e.g. 2, 4)
%
%   Returns
%       approximation_coefficients: low frequency coefficients
%       detail_coefficients: high frequency coefficients
%

% example:
%   signal_transformed = swt(rand(1024,1), 5, 'Daubechies', 4)

qmf = MakeONFilter(wavelet, order);
signal_length_pow2 = nextpow2(length(signal)); % 

if length(signal) == 2^signal_length_pow2
    swt_coefs = FWT_Stat(signal,signal_length_pow2-max_level,qmf); 
    approximation_coefficients = swt_coefs(:,1);
    detail_coefficients = flip(swt_coefs(:,2:end),2);
else
    error('Wavelet decomposition requires signal with length equal to a power of 2.')
end
