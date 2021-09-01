function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y


% We can measure the accuracy of our hypothesis function by using a cost function.

%% -------------------test ------------------------------------------

%data = load('ex1data1.txt');
%y = data(:, 2);
%m = length(y); % number of training examples = 97
%X = [ones(m, 1), data(:,1)]; % [full 1 column, data from the file] = 97x2
%theta = zeros(2, 1);

%% ------------------end test-----------------------------------------


% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


predictions = X*theta; % 97x1
% X = [ones(m, 1), data(:,1)]; m  =  number of training examples. m = vetor. data = vetor. data = first column of ex1data
%theta = zeros(2, 1); vetor 2x1 [0; 0] 
% X = [number-of-training-examples(97) = full of ones  first-column-of-ex1data(97)] 
% predictions = (97,2) * [0; 0] = 97x1

sqrtErros = (predictions - y).^2; % [1,1] = 0 - 17.592 = 17.592^2 = 309
%predictions = all zeros 97x1
%y = data(:, 2); all data from the second column of txt ex1data 97x1

soma = sum(sqrtErros); % 6222.1
J = (1/(2*m))* soma;
% m = number of training examples = 97
%soma = 6222.1
%2 * 97 = 194
% 1/194 * 6222.1 = 32.073


% =========================================================================

end
