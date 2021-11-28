function Z = projectData(X, U, K)
%PROJECTDATA Computes the reduced data representation when projecting only
%on to the top k eigenvectors
%   Z = projectData(X, U, K) computes the projection of
%   the normalized inputs X into the reduced dimensional space spanned by
%   the first K columns of U. It returns the projected examples in Z.
%

% You need to return the following variables correctly.
Z = zeros(size(X, 1), K);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the projection of the data using only the top K
%               eigenvectors in U (first K columns).
%               For the i-th example X(i,:), the projection on to the k-th
%               eigenvector is given as follows:
%                    x = X(i, :)';
%                    projection_k = x' * U(:, k);
%


%subsetU = U(:, 1:K);
%Z = X * subsetU;

%for i = 1:size(X, 1)
%    x = X(i, :)';
%    Z(i, :) = x' * U(:, 1:K);
%end
% ====================== YOUR CODE HERE ======================

%given a dataset X,
%the principal components U,
%and the desired number of dimensions to reduce to K.

%project each example in X onto the top K components in U.
%Note that the top K components in U are given by the first K columns of U, that is U reduce = U(:, 1:K)
Ureduce = U(:, 1:K);
Z = X * Ureduce;

% ====================== YOUR CODE HERE ======================

% =============================================================

end
