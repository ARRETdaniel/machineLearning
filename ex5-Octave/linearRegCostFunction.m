function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the
%   cost of using theta as the parameter for linear regression to fit the
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
tempTheta = theta;
tempTheta(1) = 0; %the θ0 term is represented as theta(1) since indexing in Octave/MATLAB starts from 1).

%Recall that regularized linear regression has the following cost function:
J = (1 / (2*m) ) * sum(((X * theta)-y).^2) + (lambda / (2 * m))*sum(tempTheta.^2);
% λ is a regularization parameter

temp = X * theta;
error = temp - y;

%the partial derivative of regularized linear regression’s cost for θj is defined ...
% the gradient:
grad = (1 / m) * (X' * error) + (lambda/m)*tempTheta;

%{
h = X*theta;
hError = h - y;
sumSquaredError = sum(hError .^ 2);
regTermLeft = (1/(2 * m)) * sumSquaredError;

thetaWithoutBias = theta(2:end);
sumSquaredTheta = sum(thetaWithoutBias .^ 2);
regTermRight = (lambda / (2 * m)) * sumSquaredTheta;

J = regTermLeft + regTermRight;

grad = (1/m) * X' * hError;
grad(2:end) += (lambda / m) * thetaWithoutBias;


%}








% =========================================================================

grad = grad(:);

end
