# Multiresolution Regularity Analysis
Multiresolution information entropy analysis of time series data

## Usage
For a given time series signal, the following functions can be called in roughly the below order:

- `preprocess.m` - centers time series signal, and pad with zeroes to reach a length corresponding to a power of 2 (required for wavelet analysis)

- `multiresolution_regularity.m` - generates a vector of entropy values across desired wavelet scales

- `get_frequency_band_edges.m` - computes the frequency bands of the desired wavelet scales


## Dependencies
This code relies on WaveLab to compute wavelet transforms which can be found [here](https://statweb.stanford.edu/~wavelab/Wavelab_850/index_wavelab850.html). Download and add to your path.



## Reference

Smith, R.X., Jann, K., Ances, B. and Wang, D.J. (2015), Wavelet-based regularity analysis reveals recurrent spatiotemporal behavior in resting-state fMRI. Hum. Brain Mapp., 36: 3603-3620. https://doi.org/10.1002/hbm.22865

https://onlinelibrary.wiley.com/doi/abs/10.1002/hbm.22865
