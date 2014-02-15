Q1)
a) myIntegration(Image,t,theta,stepsize) => performs integration of the image intensities along L(t,theta)

b) myRadonTrans(Image,60,128) => Performs radon transform on the given image with theta stepsize=3. It returns a matrix. The transpose of this matrix will yeild the desired image.

c) The following images were generated  as per varying delta `s`:
	a) partC0-5
	b) partC1
	c) partC3
	 
	We can observe that the image with delta `s` 0.5 is the sharpest whereas that with 3 is rough.
	This is pretty much obvious given the fact that as we have less delta `s`, we have more datapoints, thus the output is more sharp.