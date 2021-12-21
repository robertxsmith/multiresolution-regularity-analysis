function entropy = compute_entropy_vectorized(patterns, max_pattern_length, distance_threshold)
% Compute Sample Entropy 
% Inputs
%   patterns - 2D array of patterns 
%   max_pattern_length - pattern length to use for entropy calc
%   distance_threshold - maximum distance between points to match
%
% Outputs
%   entropy - Sample Entropy 
%
% TODO: add looping option for computing pattern differences for long signals (memory)

% vectorized approach to compute pattern differences. 
num_patterns = length(patterns);
repeated_pattern_array = repmat(patterns',1,num_patterns); 
elementwise_differnces = bsxfun(@minus, repeated_pattern_array, patterns(:)' ); 
elementwise_differnces = reshape(elementwise_differnces' , max_pattern_length , num_patterns^2);  
elementwise_differnces = elementwise_differnces';

% l1-norm 
thresholded_differences = distance_threshold - abs(elementwise_differnces)'; 
thresholded_differences = thresholded_differences >= 0; 

% tally matched patterns for each pattern length
accumulated_matches = cumsum(thresholded_differences,1); 
total_possible_matches = cumsum(ones(size(thresholded_differences)),1); 
pattern_match = (accumulated_matches - total_possible_matches) == 0; 
total_matches = sum(pattern_match,2) - num_patterns;

% compute probability of two patterns matching for each pattern length
match_probability = total_matches / (num_patterns*(num_patterns-1));

% compute Sample Entropy based on longest patterns
entropy = -log(match_probability(end)/match_probability(end-1))';