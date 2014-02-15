function y = myRadonTransTheta(Image,theta,n_t)
    
    ts = linspace(-90,90,n_t);
    c = size(Image)/2;
    
    result = zeros(n_t);
    size(result);
    
    res1 = myIntegration2(Image,theta*pi/180,0.5);
    res2 = myIntegration2(Image,theta*pi/180,1);
    res3 = myIntegration2(Image,theta*pi/180,3);
    
    imagesc(res1);
    %imagesc(res2);
    %imagesc(res3);
    
    %y = [res1;res2;res3]
    y=0 
end