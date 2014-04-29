function [d, Z] = multi_procrustes(I,n,no_of_samples)
	% array fun
	d = 1;
	Z = zeros(n,2,no_of_samples);

	
	muX = mean(I(:,:,1),1);
	ssqX = sum(I(:,:,1).^2,1);
    ssqX = sum(ssqX);
    normX = sqrt(ssqX);

	% centering and normalising the data
	for i = 1:no_of_samples,
	  	centered = center(I(:,:,i));
		d = 1;
		Z(:,:,i) = centered;
	end;

	mean_sample = Z(:,:,1);

	for i = 2:no_of_samples,
	  	rotated = rotate(mean_sample,I(:,:,i),muX,normX,n);
		d = 1;
		Z(:,:,i) = rotated;
	end;




function z = center(X)
    [a, b]   = size(X);
    muX = mean(X,1);
    z = X - repmat(muX, a, 1);
    ssqI = sum(X.^2,1);
    ssqI = sum(ssqI);
    normI = sqrt(ssqI);
    z = z / normI ;

function z = rotate(base,Y0,muX,normX,n)
	A = double(base') * Y0;

	% Singular Value Decomposition
	[L, D, M] = svd(A);
	T = M * L';


	z = normX * Y0 * T + double(repmat(muX, n, 1));
