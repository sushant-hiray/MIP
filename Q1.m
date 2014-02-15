function y = myIntegration(Image,t,theta,step_size)
    [m,n] = size(Image);
    s =0;
    x = t*cos(theta) - s*sin(theta);
    y = t*sin(theta) + s*cos(theta);
    sum =0;
    while (0<=x<=m&& 0<=y<=n) do 
        sum = sum + interp2(Image,x,y);
        s =s + step_size;
        x = t*cos(theta) -s*sin(theta);
        y = t*sin(theta) + s*cos(theta);
    end  
    s=-0.02;
    while (0<=x<=m && 0<=y<=n) do
        sum = sum + interp2(Image,x,y);
        s =s - step_size;
        x = t*cos(theta) -s*sin(theta);
        y = t*sin(theta) + s*cos(theta);
    end

end




   
    