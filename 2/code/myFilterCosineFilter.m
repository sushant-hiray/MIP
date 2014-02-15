function y = myFilterCosineFilter(Image,L)
%L = 50000000;
RadonImage = radon(Image);
FFTImage = fft2(RadonImage);

filter = arrayfun(@(x) cos(x*05*pi/L)*x*abs(x),FFTImage); % shep logan

IFFTImage = ifft2(filter);

IRadonImage = iradon(IFFTImage,0:179);

imagesc(IRadonImage);


end

