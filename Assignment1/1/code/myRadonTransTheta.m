function y = myRadonTransTheta(Image,theta,n_t)
    s = size(Image);
    ts = linspace(0,s(1),(s(1)-1)/n_t +1);
    %result = zeros(n_t);
    %size(result);
    
    res = myIntegration2(Image,theta*pi/180,n_t);
    plot(ts,res)
    %y = [res1;res2;res3]
    y=res;
end