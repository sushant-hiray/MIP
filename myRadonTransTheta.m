function y = myRadonTransTheta(Image,theta,n_t)
    s = size(Image)
    ts = linspace(0,s(1),s(1)/n_t-1);
    c = size(Image)/2;
    
    %result = zeros(n_t);
    %size(result);
    
    res1 = myIntegration2(Image,theta*pi/180,n_t);
    res2 = myIntegration2(Image,theta*pi/180,n_t);
    res3 = myIntegration2(Image,theta*pi/180,n_t);
    
    %imagesc(res1);
    %imagesc(res2);
    %imagesc(res3);
    size(ts)
    size(res3)
    plot(ts,res3)
    %y = [res1;res2;res3]
    y=0 
end