function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%



%{}
testValues = [0.01, 0.03, 0.1, 0.3,  1, 3, 10, 30];

results = [];

for loopC=1:8,
    for loopSigma=1:8,


      testC = testValues(loopC);
      testSigma = testValues(loopSigma);

      model= svmTrain(X, y, testC, @(x1, x2) gaussianKernel(x1, x2, testSigma));
      predictions = svmPredict(model, Xval);

      testError = mean(double(predictions ~= yval));

      fprintf("C: %f\nsigma: %f\nerror: %f\n", testC, testSigma, testError);

      results = [results; testC, testSigma, testError];

    end
end

[minError, minIndex] = min(results(:,3));



C = results(minIndex,1);
sigma = results(minIndex,2);



fprintf("\n\nLeast error:\nC: %f\nsigma: %f\nerror: %f\n", C, sigma, minError);

% Wil return this one
% C: 0.300000
% sigma: 0.100000
% error: 0.035000

% but this one will work too
% C: 1.000000
% sigma: 0.100000
% error: 0.035000
%}

%use the cross validation set Xval, yval to determine the
%best C and σ parameter to use.

multiplicativeSteps = [0.01 0.03 0.1 0.3 1 3 10 30]';
minError = Inf;
curC = Inf;
cur_sigma = Inf;

%yval are the true labels from the cross validation Set

for i = 1:8
	for j = 1:8
		model = svmTrain(X, y, multiplicativeSteps(i), @(x1, x2) gaussianKernel(x1, x2, multiplicativeSteps(j)));
		predictions = svmPredict(model,Xval); % a vector containing all the predictions from the SVM
		%svmPredict function to generate the predictions for the cross validation set.
		error = mean(double(predictions ~= yval)); %evaluate the error on the cross validation set
		if error < minError
			minError = error;
			curC = multiplicativeSteps(i);
			cur_sigma = multiplicativeSteps(j);
		end
	end
end

C = curC;
sigma = cur_sigma;


steps = [ 0.01 0.03 0.1 0.3 1 3 10 30 ];
minError = Inf;
minC = Inf;
minSigma = Inf;



%{}
C_list = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigma_list = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
min_err=1;

for i=1:8,
	Ci = C_list(i);
	for j=1:8,
		sigma_j = sigma_list(j);
		model= svmTrain(X, y, Ci, @(x1, x2) gaussianKernel(x1, x2, sigma_j));
		predictions = svmPredict(model, Xval);
		pred_err = mean(double(predictions ~= yval));
		%fprintf("Ci=%f, sigma_j=%f, pred_err=%f, min_err=%f\n", Ci, sigma_j, pred_err, min_err);
		if (pred_err < min_err),
			min_err = pred_err;
			C = Ci;
			sigma = sigma_j;
			%fprintf("	pred_err < min_err, %f--->C, %f --> sigma\n", Ci, sigma_j)
		end;
	end;
end;
%}
% =========================================================================

end
