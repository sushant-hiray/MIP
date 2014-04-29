function Z = procrustes_method(X, Y)

[n, m]   = size(X);
[ny, my] = size(Y);

if ny ~= n
    error('InputSizeMismatch',...
          'X and Y must have the same number of rows (points).');
elseif my > m
    error('InputSizeMismatch',...
          'Y cannot have more columns (variables) than X.');
end

% Center at the origin.
muX = mean(X,1);
X0 = X - repmat(muX, n, 1);

% Center at the origin.
muY = mean(Y,1);
Y0 = Y - repmat(muY, n, 1);

ssqX = sum(X0.^2,1);
ssqY = sum(Y0.^2,1);

ssqX = sum(ssqX);
ssqY = sum(ssqY);


% The norm.
normX = sqrt(ssqX); 
normY = sqrt(ssqY); 

% Scale to equal (unit) norm.
X0 = X0 / normX;
Y0 = Y0 / normY;

% The optimum rotation matrix of Y.
A = double(X0') * Y0;

% Singular Value Decomposition
[L, D, M] = svd(A);
T = M * L';

Z = normX * Y0 * T + double(repmat(muX, n, 1));
