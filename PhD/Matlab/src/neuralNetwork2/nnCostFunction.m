function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
% [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
% X, y, lambda) computes the cost and gradient of the neural network. The
% parameters for the neural network are "unrolled" into the vector
% nn_params and need to be converted back into the weight matrices.
%
% The returned parameter grad should be a "unrolled" vector of the
% partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * ...
(input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * ...
(input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

X = [ones(m, 1) X];
y = eye(num_labels)(y,:);
<<<<<<< HEAD
%I = eye(num_labels);
%y = I(y,:);
=======
>>>>>>> a3e3fd7606dd7c9cc57b1f26ac503a6429903fd5

a1 = X;
z2 = a1 * Theta1';
a2 = sigmoid(z2);

n = size(a2, 1);
a2 = [ones(n,1) a2];

z3 = a2 * Theta2';
a3 = sigmoid(z3);

regularization = (lambda/(2*m)) * (sum(sum((Theta1(:,2:end)).^2))...
 + sum(sum((Theta2(:,2:end)).^2)));
J = ((1/m) * sum(sum((-y .* log(a3))-((1-y) .* log(1-a3)))))...
 + regularization;

Delta_3 = a3 - y;
Delta_2 = (Delta_3 * Theta2(:,2:end)) .* sigmoidGradient(z2);

Delta_cap2 = Delta_3' * a2;
Delta_cap1 = Delta_2' * a1;

Theta1_grad = ((1/m) * Delta_cap1) + ((lambda/m) * (Theta1));
Theta2_grad = ((1/m) * Delta_cap2) + ((lambda/m) * (Theta2));

Theta1_grad(:,1) = Theta1_grad(:,1) - ((lambda/m) * (Theta1(:,1)));
Theta2_grad(:,1) -= ((lambda/m) * (Theta2(:,1)));

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end