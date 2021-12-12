function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X),
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
%

% Useful variables
[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.
%


% =============================================================


%This function
%takes as input the data matrix X and should output an n-dimension vector
%mu that holds the mean of all the n features and another n-dimension vector
%sigma2 that holds the variances of all the features.

%vectorized implementation
%= (1 / m) * sum(X)
mu = mean(X);

%var function will (by default) use 1/m−1, instead of 1/m, when computing σi^2
% = (1 / m) * sum((X - muT).^2)
sigma2 = var(X,opt=1);

% =============================================================
% =============================================================

%{
muT = (1 / m) * sum(X);
mu = muT';
sigma2T = (1 / m) * sum((X - muT).^2);
sigma2 = sigma2T';

% =============================================================
mu = mean(X);
sigma2 = var(X, 1);

mu = mu(:);
sigma2 = sigma2(:);
%}

% =============================================================


end
