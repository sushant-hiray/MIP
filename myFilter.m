function y = myFilter(Image)

RadonImage = radon(Image);
FFTImage = fft2(RadonImage);

filter = arrayfun(@(x) x*abs(x),FFTImage);

IFFTImage = ifft2(filter);

IRadonImage = iradon(IFFTImage,0:179);

imagesc(IRadonImage);


end

