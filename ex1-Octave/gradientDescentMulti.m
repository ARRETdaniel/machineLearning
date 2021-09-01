function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %


    pridictions = X * theta; % 97x1
     % X = [ones(m, 1), data(:,1)]; m  =  number of training examples. m = vetor. data = vetor. data = first column of ex1data
     %theta = zeros(2, 1); vetor 2x1 [0; 0] 
     % X = [number-of-training-examples(97) = full of ones  first-column-of-ex1data(97)] 
     % predictions = (97,2) * [0; 0] = 97x1
    error = pridictions - y; 
     
    
    newX = error' * X;
    theta = theta - ((alpha/m)* newX');
    
    %equa0 = theta(1) - ( alpha /m ) * sum(error.* X(:,1)); %equation 0
    %equa1 = theta(2) - ( alpha /m ) * sum(error.* X(:,2)); %equation 1
    % m = number of training examples = 97
    % alpha = 0.01;
    %theta = [equa0; equa1];
    
    %theta = theta - (1/m) * alpha * (X' * error);









    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
