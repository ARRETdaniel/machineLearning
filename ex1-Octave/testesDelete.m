%fprintf('Plotting Data ...\n')
data = load('ex1data1.txt');
%X = data(:, 1); 
y = data(:, 2);
m = length(y); % number of training examples

RR = zeros(97,2);
QQ = zeros(2, 1)
YY = RR * QQ;
ZZ =  data(:,1);
