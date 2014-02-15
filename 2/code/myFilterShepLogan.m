function myFilterShepLogan(Image)
RadonImage = radon(Image);
FFTImage = fft2(RadonImage);


absW = (arrayfun(@(x) abs(x),FFTImage));
wmax= max(max(absW))
%disp(wmax)
%wmax =wmax/2
filter = arrayfun(@(x) sinc(x*05*pi/wmax)*x*abs(x),FFTImage); % shep logan

IFFTImage = ifft2(filter);

IRadonImage = iradon(IFFTImage,0:179);

imagesc(IRadonImage);

end

