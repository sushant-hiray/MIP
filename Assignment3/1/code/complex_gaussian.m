function y = complex_gaussian(Y,X,S,sigma)
y = 2*(ifft2(fft2(X).*S.*S') - ifft2(Y.*S'))/(sigma*sigma);
