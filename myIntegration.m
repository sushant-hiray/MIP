function y = myIntegration(Image,c,t,theta,step_size)
    [m,n] = size(Image);
    s =0;
    
    x = c(1) +t*cos(theta) - s*sin(theta);
    y = c(2) +t*sin(theta) + s*cos(theta);
    sum =0;
    condition = 0<=x && x<=m && 0<=y && y <=n;
    
    while condition 
        sum = sum + interp2(Image,x,y);
        s =s + step_size;
        x = c(1) + t*cos(theta) -s*sin(theta);
        y = c(2) + t*sin(theta) + s*cos(theta);
        condition =  0<=x && x<=m && 0<=y && y <=n;
    end  
    s=-0.02;
    condition = 0<=x && x<=m && 0<=y && y <=n;
    while condition 
        sum = sum + interp2(Image,x,y);
        s =s - step_size;
        x = c(1) + t*cos(theta) -s*sin(theta);
        y = c(2) + t*sin(theta) + s*cos(theta);
        condition =  0<=x && x<=m && 0<=y && y <=n;
    end

end




   
    