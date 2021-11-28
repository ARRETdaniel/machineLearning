function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

% ====================== YOUR CODE HERE ======================
% Instructions: You should first compute the covariance matrix. Then, you
%               should use the "svd" function to compute the eigenvectors
%               and eigenvalues of the covariance matrix.
%
% Note: When computing the covariance matrix, remember to divide by m (the
%       number of examples).
%

%sigma = (X' * X) ./ m;
%[U, S, V] = svd(sigma);

% ====================== YOUR CODE HERE ======================
% Σ = (1/m) *  X' * X   % Σ is a n × n matrix and not the summation operator

%  X is the data matrix with examples in rows
% m is the number of examples.
sigma = (1/m) * X'*X;
[U, S, V] = svd(sigma); %  run SVD on it to compute the principal components.
% U will contain the principal components and
% S will contain a diagonal matrix.
% ====================== YOUR CODE HERE ======================

% X: m*n
%sigma = X' * X ./ m;   % n*n
%[U S V] = svd(sigma);



% =========================================================================

end
