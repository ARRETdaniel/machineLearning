function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

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
%
% Note: grad should have the same dimensions as theta
%

%cost function in logistic regression is
%J(?) = 1/m (X m i=1)[?y(i)log(h?(x(i))) ? (1 ? y(i)) log(1 ? h?(x(i)))]
J = 1/m * ((-y') * (log(sigmoid(X*theta))) - (1-y') * (log(1 - sigmoid(X*theta))));

%gradient of the cost is a vector of the same length as ? where the j th element (for j = 0, 1, . . . , n) is defined as follows:
%?J(?)/??j = 1/m (X m i=1)(h?(x(i)) ? y(i))x(i)j
grad = 1/m * X' * (sigmoid(X*theta)-y);

% =============================================================

%J = (-1 / m) * sum(y.*log(sigmoid(X * theta)) + (1 - y).*log(1 - sigmoid(X * theta)));
%temp = sigmoid (X * theta);
%error = temp - y;
%grad = (1 / m) * (X' * error); 

% =============================================================

%predictions =  sigmoid(X*theta);
%leftPart = -y' * log(predictions);
%rightPart = (1 - y') * log(1 - predictions);
%J = (1 / m) * (leftPart - rightPart);
%grad = (1 / m) * ((predictions - y)' * X);

% =============================================================

end

