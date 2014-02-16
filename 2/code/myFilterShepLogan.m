function y = myFilterShepLogan(Image)

N=size(Image,1);
theta = 0:179;
N_theta = length(theta);
[R,xp] = radon(Image,theta);

N1 = length(xp);
freqs=linspace(-1, 1, N1).';
wmax=2*pi;
%shepp logan filter
my_filter = arrayfun(@(x) sinc(x*05*pi/wmax)*abs(x),freqs); % shep logan
my_filter = repmat(my_filter, [1 N_theta]);
% apply fft in one dimension and use fftshift to bring 0 frequency to
% center
ft_R = fftshift(fft(R,[],1),1);

%apply the filter (point by point multiplication)
filteredProj = ft_R .* my_filter;

%apply the inverse fft shift (as we applied fft shift before)
filteredProj = ifftshift(filteredProj,1);

%get the real values
ift_R = real(ifft(filteredProj,[],1));

% apply inverse FBP without a filter
I1 = iradon(ift_R, theta, 'linear', 'none', 1.0, N);

subplot(1,2,2);imagesc( real(I1) ); title('Shepp Logan filtering')
colormap(gray(256)); axis image;


subplot(1,2,1);imagesc( real(Image) ); title('Original Image')
colormap(gray(256)); axis image;

y = I1;


