function thresholds = compute_thresholds(wave_coefs, dist_scale)
% Compute the distance threshold adjusted for noise and signal levels 
% Estimate noise level assuming most signal at high frequencies (D1) is noise.
%
%   Args:
%       wave_coefs:  2-D columnar array of sequential signals (e.g. time series)
%       dist_scale:  scaling factor to adjust threshold based on signal level 
%       noise_floor: noise level based on bayesian estimation
%
%   Returns:
%       threshold:   distance below which pattern elements match

noise_floor            = mad(wave_coefs(:,end))/.6745; 
bayes_floor            = sqrt(2)*noise_floor;

signal_levels          = mad(wave_coefs(:,1:end-1))/.6745;
adjusted_signal_levels = signal_levels.^2 - noise_floor^2;
adjusted_signal_levels = max(adjusted_signal_levels,0);
adjusted_signal_levels = sqrt(adjusted_signal_levels);

thresholds             = dist_scale * adjusted_signal_levels + bayes_floor;