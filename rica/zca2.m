function [Z] = zca2(x)
epsilon = 1e-4;
% You should be able to use the code from your PCA/ZCA exercise
% Retain all of the components from the ZCA transform (i.e. do not do
% dimensionality reduction)

% x is the input patch data of size
% z is the ZCA transformed data. The dimenison of z = x.
    avg = mean(x, 1); % can't ignore for unnatural images like digits?
    x = bsxfun(@minus, x, avg);
    Sigma = x * x' / size(x, 2);
    [U, S, V] = svd(Sigma);
    xRot = U' * x;
    xPCAWhite = bsxfun(@rdivide, xRot, sqrt(diag(S) + epsilon));
    Z = U * xPCAWhite; % xZCAWhite
