myNumOfColors = 200;
myColorScale = [ [0:1/myNumOfColors:1]' , [0:1/myNumOfColors:1]' , [0:1/myNumOfColors:1]' ];


y = myRadonTransTheta(phantom(128),60,1); %step = 1
imagesc(y);
colormap (myColorScale); colormap jet; colorbar;

y=myRadonTransTheta(phantom(128),60,0.5); %step = 0.5
imagesc(y);
colormap (myColorScale); colormap jet; colorbar;

y=myRadonTransTheta(phantom(128),60,3); %step = 3
imagesc(y);
colormap (myColorScale); colormap jet; colorbar;