function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).
% ---------------------------------

%Before you start with the actual cost function, recall that the logistic regression hypothesis is defined as:
%h?(x) = g(?T x)

%where function g is the sigmoid function. The sigmoid function is defined as:
% g(z) = 1 ./ 1 + e(?z)

g = 1 ./ (1+exp(-z)); % g(z) = 1 ./ 1 + e(?z)

%f=@(h) 1 ./ (1 + exp(-h));
%g = f(z);

% =============================================================

end
