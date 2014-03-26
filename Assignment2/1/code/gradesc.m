function y = gradesc(In, step, beta, gamma, grf,momentum,expIm)
threshold = 0.08;
prev = In;
temp = -((1-beta)*complex_gaussian(In,prev,1) + beta*mrf_quad(prev));
prev = prev + step*temp;

prevGrad =temp;

iteration =0;


prosteriorProb =  mrf_quad_prob(prev,beta).*complex_gaussian_prob(In,prev,1,beta);

temp = -((1-beta)*complex_gaussian(In,prev,1) + beta*mrf_quad(prev));
tempV = temp(:);
prevGradV = prevGrad(:);
prev = prev + step*temp;


while(norm(abs(temp-prevGrad),2)/norm(abs(prevGrad),2) > threshold)
    iteration = iteration +1;
    %disp(iteration);
    prevGrad =temp;
    prevGradV = prevGrad(:);
    if strcmp(grf,'quad') == 1
        temp = -((1-beta)*complex_gaussian(In,prev,1) + beta*mrf_quad(prev));
        prev = prev + (1-momentum)*step*temp +momentum*prevGrad;
        prosteriorProb =  mrf_quad_prob(prev,beta).*complex_gaussian_prob(In,prev,1,beta);
        
    elseif strcmp(grf,'huber') == 1
        temp = (1-beta)*complex_gaussian(In,prev,1) + beta*mrf_huber(prev,gamma);
        prev = prev + step*temp;
        prosteriorProb =  mrf_huber_prob(prev,beta,gamma).*complex_gaussian_prob(In,prev,1,beta);

    elseif strcmp(grf,'g3') == 1
        temp = (1-beta)*complex_gaussian(In,prev,1) + beta*mrf_g3(prev,gamma);
        prev = prev + step*temp;
        prosteriorProb =  mrf_g3_prob(prev,beta).*complex_gaussian_prob(In,prev,1,beta);
        
    end
    tempV = temp(:);
    
    
    prosteriorProb = prosteriorProb./ complex_gaussian_prob(In,expIm,1,0);
    %disp(max(prosteriorProb(:)));
    abc = norm(abs(tempV-prevGradV),2)/norm(abs(prevGradV),2)
   

end
y = prev;





function z = complex_gaussian_prob(Y,X,sigma,beta)
a = exp(-((1-beta)*(abs(Y - X).^2))/(sigma*sigma));
%a = a./(sigma*sigma*pi);
a = a.*(1-beta)*(1-beta);
a = a./(sigma*sigma*pi);
%disp(max(a(:)));
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


function z = mrf_huber_prob(A,beta,gamma)

u = circshift(A,[-1,0]);
d = circshift(A,[1,0]);
l = circshift(A,[0,-1]);
r = circshift(A,[0,1]);

u1 = arrayfun(@(x) check(x,gamma),u1);
l1 = arrayfun(@(x) check(x,gamma),l1);
r1 = arrayfun(@(x) check(x,gamma),r1);
d1 = arrayfun(@(x) check(x,gamma),d1);


a = exp(-beta*(u1+l1+r1+d1));
y = sum(a(:));
%disp('y is ');
%disp(y);
b = a.*(1/y);
%disp(max(b(:)));
z=b;




function z = check(x,g)
    if x > g
      z =  g*x - 0.5*g*g;
    else
      z = 0.5*x*x;
    end





function y = mrf_g3_prob(A,gamma, beta)

%A is Noisy Image

u = circshift(A,[-1,0]);
d = circshift(A,[1,0]);
l = circshift(A,[0,-1]);
r = circshift(A,[0,1]);

u1 = arrayfun(@(x) check_g3(x,gamma),u1);
l1 = arrayfun(@(x) check_g3(x,gamma),l1);
r1 = arrayfun(@(x) check_g3(x,gamma),r1);
d1 = arrayfun(@(x) check_g3(x,gamma),d1);


a = exp(-beta*(u1+l1+r1+d1));
y = sum(a(:));
%disp('y is ');
%disp(y);
b = a.*(1/y);
%disp(max(b(:)));
z=b;

function z = check_g3(x,g)
z = g*x - g*g*log(1+(x/g));





function z = RRMSE(A,B)
X = (abs(A) - abs(B)).^2;
X = sum(X(:));
X = X ^ (1/2);
Y = abs(A)^.2;
Y = sum(Y(:));
Y = Y ^ (0.5);
z = X/Y;

