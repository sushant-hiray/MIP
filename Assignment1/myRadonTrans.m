function y = myRadonTrans(Image,n_thetas,step_size)
    thetas = linspace(0,180,n_thetas);
    c = size(Image)/2;
    ts = linspace(-90,90,c(1)*2/step_size-1);
    
    result = zeros(n_thetas,c(1)*2/step_size-1);
    size(result);
    for i=1:length(thetas)
        theta= thetas(i);
        res = myIntegration2(Image,theta*pi/180,step_size);
        %size(res)
        result(i,:) = res;
    end
    y = result;
end