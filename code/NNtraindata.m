global T;
global labda;
input_layer_size  = 784;
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10

load('traindata.mat');

m = size(X, 1);
X = double(X);
sel = randperm(size(X, 1));
sel = sel(1:100);
displayData(X(sel, :));
load('ex5weights.mat');
nn_params = [Theta1(:) ; Theta2(:)];
lambda = 0;


%%%%%%%%%%%%
%%%%%%%%


J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                   num_labels, X, y, lambda);
lambda = 1;
J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, ...
                   num_labels, X, y, lambda);


g = sigmoidGradient([1 -0.5 0 0.5 1]);

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

checkNNGradients;

lambda = 3;
checkNNGradients(lambda);

% Also output the costFunction debugging values
debug_J  = nnCostFunction(nn_params, input_layer_size, ...
                          hidden_layer_size, num_labels, X, y, lambda);
%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', T);

%  You should also try different values of lambda
lambda = labda;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);


[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);


Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

%  X = double(X);
% load('hgf.mat')
% pred = predict(Theta1, Theta2, X);
% 
% fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);


load('testdata.mat');
X = double(X);
sel = randperm(size(X, 1));
sel = sel(1:100);
displayData(X(sel, :));


% load('hgf.mat')
pred = predict(Theta1, Theta2, X);
fprintf('\nTest Set Accuracy: %f\n', mean(double(pred == Y)) * 100);
hpred=findobj('Tag','Accuracy');
set(hpred,'string',sprintf('%.2f%',mean(double(pred == Y)) * 100));
