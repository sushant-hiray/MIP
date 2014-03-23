function y = mrf_g3(A,gamma)

%A is Noisy Image
%gamma is huber variable

u = circshift(A,[-1,0]);
d = circshift(A,[1,0]);
l = circshift(A,[0,-1]);
r = circshift(A,[0,1]);

u1=abs((A-u));
d1=abs((A-d));
l1=abs((A-l));
r1=abs((A-r));

u1 = arrayfun(@(x) derv(x,gamma),u1);
l1 = arrayfun(@(x) derv(x,gamma),l1);
r1 = arrayfun(@(x) derv(x,gamma),r1);
d1 = arrayfun(@(x) derv(x,gamma),d1);

y = u1+d1+l1+r1;

%derv = u*gamma/(gamma+u)
function z = derv(x,g)
    z = x*g/(g+x);