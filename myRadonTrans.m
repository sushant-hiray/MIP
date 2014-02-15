function y = myRadonTrans(Image,n_thetas,n_t,step_size)
    thetas = linspace(0,180,n_thetas);
    ts = linspace(-90,90,n_t);
    c = size(Image)/2;
    result = zeros(n_thetas,n_t);
    for i=1:length(thetas)
        theta= thetas(i)*pi/180;
        for j=1:length(ts)
            %disp(j);
            t = ts(j);
            result(i,j) = myIntegration(Image,c,t,theta,step_size);
        end
    end
    y = result;
end