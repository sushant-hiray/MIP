function [Y] = pca(I,n,no_of_samples)
	% array fun
    covar = zeros(n,n);
    for i = 1:no_of_samples,
        Z(:,:,i) = center(I(:,:,i));
      
    end
    m = mean(Z,3);
    
    for i = 1: no_of_samples,
        Z(:,:,i) = Z(:,:,i) -m;
        covar = covar + Z(:,1,i)*Z(:,1,i)';
    end
    [V,D] = eig(covar);
    Y = V;
    
function z = center(X)
    [a, b]   = size(X);
    muX = mean(X,1);
    z = X - repmat(muX, a, 1);
    ssqI = sum(X.^2,1);
    ssqI = sum(ssqI);
    normI = sqrt(ssqI);
    z = z / normI ;
    