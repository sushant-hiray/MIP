function y = myFilterCosineFilter(Image,L)
%L = 50000000;
RadonImage = radon(Image);
FFTImage = fft2(RadonImage);

absW = (arrayfun(@(x) abs(x),FFTImage));
wmax= max(max(absW))

filter = arrayfun(@(x) cos(x*05*pi/wmax)*x*abs(x),FFTImage);

IFFTImage = ifft2(filter);

IRadonImage = iradon(IFFTImage,0:179);

imagesc(IRadonImage);


end

