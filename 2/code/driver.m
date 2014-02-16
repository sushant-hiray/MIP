myNumOfColors = 200;
myColorScale = [ [0:1/myNumOfColors:1]' , [0:1/myNumOfColors:1]' , [0:1/myNumOfColors:1]' ];

y=myFilterShepLogan(phantom(256),pi/2);
imagesc(real(y))
colormap (myColorScale); colormap jet; colorbar;

y=myFilterShepLogan(phantom(256),pi);
imagesc(real(y))
colormap (myColorScale); colormap jet; colorbar;

y=myFilter(phantom(256),pi/2);
imagesc(real(y))
colormap (myColorScale); colormap jet; colorbar;

y=myFilter(phantom(256),pi);
imagesc(real(y))
colormap (myColorScale); colormap jet; colorbar;

y=myFilterCosineFilter(phantom(256),pi);
imagesc(real(y))
colormap (myColorScale); colormap jet; colorbar;

y=myFilterCosineFilter(phantom(256),pi/2);
imagesc(real(y))
colormap (myColorScale); colormap jet; colorbar;
