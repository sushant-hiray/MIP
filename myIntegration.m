function y = myIntegration(Image,t,theta,step_size)
    [m,n] = size(Image);
    c = size(Image)/2;
    R = [[cos(theta) -sin(theta)],[sin(theta) cos(theta)]];
    
    %size(Image)
    %[X,Y] = meshgrid(1:m,1:n);
    [X,Y] = meshgrid(1:step_size:m,1:step_size:n);
    
    %size(X)
    X1 = X - c(1);
    Y1 = Y - c(2);
    X2 = c(1) + (X1)*cos(theta) -(Y1)*sin(theta);
    Y2 = c(2) + (X1)*sin(theta) + (Y1)*cos(theta);

    Z = interp2(Image,X2,Y2);
    Z(find(isnan(Z)))=0;
    size(Z);
    cor =  floor((t+n/2)/step_size);
    a =sum(Z);
    y = a(cor);
end




   
    