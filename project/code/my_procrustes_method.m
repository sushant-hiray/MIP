function [d, Z] = my_procrustes_method(X, Y)

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


