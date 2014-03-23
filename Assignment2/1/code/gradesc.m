function y = gradesc(In, step, beta, gamma, grf)
threshold = 0.1;
prev = In;
temp = (1-beta)*complex_gaussian(In,prev,1) + beta*mrf_quad(prev);
prev = prev + step*temp;
while(abs(temp) > threshold )
    if strcmp(grf,'quad') == 1
        temp = (1-beta)*complex_gaussian(In,prev,1) + beta*mrf_quad(prev);
        prev = prev + step*temp;
        temp

    elseif strcmp(grf,'huber') == 1
        temp = (1-beta)*complex_gaussian(In,prev,1) + beta*mrf_huber(prev,gamma);
        prev = prev + step*temp;

    elseif strcmp(grf,'g3') == 1
        temp = (1-beta)*complex_gaussian(In,prev,1) + beta*mrf_g3(prev,gamma);
        prev = prev + step*temp;
    end
end
y = prev;

