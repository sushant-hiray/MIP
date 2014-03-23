function y = myRadonTrans(Image,n_thetas,n_t)
    thetas = linspace(0,180,n_thetas);
    ts = linspace(-90,90,n_t);
    c = size(Image)/2;
    result = zeros(n_thetas,n_t);
    size(result);
    for i=1:length(thetas)
        theta= thetas(i);
        res = myIntegration2(Image,theta*pi/180,1);
        result(i,:) = res;
    end
    y = result;
end