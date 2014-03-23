function y = gradesc(In, step, beta, gamma, grf,momentum,expIm)
threshold = 0.6;
prev = In;
temp = -((1-beta)*complex_gaussian(In,prev,1) + beta*mrf_quad(prev));
%prev = prev + step*temp;
disp('hi11');
prevGrad =temp;
mintemp =norm(temp);
iteration =0;
abc = complex_gaussian_prob(In,expIm,1,0);
%disp(max(abc(:)));
prosteriorProb =  mrf_quad_prob(prev,beta).*complex_gaussian_prob(In,prev,1,beta);
while(prosteriorProb < threshold )
    iteration = iteration +1;
    
    if strcmp(grf,'quad') == 1
        temp = -((1-beta)*complex_gaussian(In,prev,1) + beta*mrf_quad(prev));
        prev = prev + (1-momentum)*step*temp +momentum*prevGrad;
        
    elseif strcmp(grf,'huber') == 1
        temp = (1-beta)*complex_gaussian(In,prev,1) + beta*mrf_huber(prev,gamma);
        prev = prev + step*temp;

    elseif strcmp(grf,'g3') == 1
        temp = (1-beta)*complex_gaussian(In,prev,1) + beta*mrf_g3(prev,gamma);
        prev = prev + step*temp;
    end
    prevGrad =temp;
    
    prosteriorProb =  mrf_quad_prob(prev,beta).*complex_gaussian_prob(In,prev,1,beta);
    %prosteriorProb = prosteriorProb./ complex_gaussian_prob(In,expIm,1,0);
    %disp(max(prosteriorProb(:)));
    %disp(min(prosteriorProb(:)));
    %imagesc(real(prev));
    %result = input('input please');

    if iteration > 10
        disp(max(prosteriorProb(:)));
        disp(min(prosteriorProb(:)));
        prosteriorProb = 1;
    end

end
y = prev;





function z = complex_gaussian_prob(Y,X,sigma,beta)
a = exp(-((1-beta)*(abs(Y - X).^2))/(sigma*sigma));
%a = a./(sigma*sigma*pi);
a = a.*(1-beta)*(1-beta);
a = a./(sigma*sigma*pi);
disp(max(a(:)));
z=a;


function z = mrf_quad_prob(A,beta)

u = circshift(A,[-1,0]);
d = circshift(A,[1,0]);
l = circshift(A,[0,-1]);
r = circshift(A,[0,1]);

u1=abs((A-u)).^2;
d1=abs((A-d)).^2;
l1=abs((A-l)).^2;
r1=abs((A-r)).^2;


a = exp(-beta*(u1+l1+r1+d1));
y = sum(a(:));
%disp('y is ');
%disp(y);
b = a.*(1/y);
%disp(max(b(:)));
z=b;











