function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta



%cost function in logistic regression is
%J(?) = 1/m (X m i=1)[-y(i)log(h?(x(i))) - (1 - y(i)) log(1 - h?(x(i)))]+ ?/2m X n j=1 ?2j
J = 1/m * ((-y') * (log(sigmoid(X*theta))) - (1-y') * (log(1 - sigmoid(X*theta)))) + (lambda / (2*m)) * sum(theta(2:end).^2);

%The gradient of the cost function is a vector where the j th element is defined as follows:
%?J(?)/??j = 1/m (X m i=1)(h?(x(i)) - y(i))x(i)j for j = 0

%?J(?)??j= 1mXmi=1(h?(x(i)) ? y(i))x(i)j!+?m?jfor j ? 1

grad(1) = 1/m * X(:,1)' * (sigmoid(X*theta)-y);
grad(2:end) = 1/m * X(:,2:end)' * (sigmoid(X*theta)-y) + (lambda/m) * theta(2:end);
% =============================================================



% =============================================================

end
