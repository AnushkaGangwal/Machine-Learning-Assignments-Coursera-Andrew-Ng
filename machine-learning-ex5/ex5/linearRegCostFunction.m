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

hypothesis = X*theta;
J = ((1/(2*m))*sum((hypothesis - y).^2))+(lambda/(2*m))*sum((theta(2:end)).^2);

% grad(1) = (1/m)*sum(hypothesis - y);
% X = X(:,2:end);
% grad(2:end) = ((1/m)*sum(X'*(hypothesis - y)))+(lambda/m)*theta(2:end);
% X = [ones(m, 1) X]; 

grad(1) = (1/m)* (X'(1,:)*(hypothesis-y));
grad(2:end) = (1/m)*(X'(2:size(X',1),:)*(hypothesis-y)) + (lambda/m)*theta(2:end);

% G = (lambda/m).*theta;
% G(1) = 0; 
% grad = (1/m)*(X'*(hypothesis - y))+G;

% =========================================================================

grad = grad(:);

end
