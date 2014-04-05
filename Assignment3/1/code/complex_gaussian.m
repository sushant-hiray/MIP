function y = complex_gaussian(Y,X,S,sigma)
y = 2*ifft2((fft2(X) - Y))/(sigma*sigma);
