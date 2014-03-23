function y = mrf_quad(A)

%A is Noisy Image
%beta is regularity factor

u = circshift(A,[-1,0]);
d = circshift(A,[1,0]);
l = circshift(A,[0,-1]);
r = circshift(A,[0,1]);

u1=abs((A-u));
d1=abs((A-d));
l1=abs((A-l));
r1=abs((A-r));
y = (u1+l1+r1+d1).*2;
