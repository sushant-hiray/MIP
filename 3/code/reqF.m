function funs = reqF
  funs.f=@f;
  funs.derX=@derX;
  funs.derY=@derY;
end

function a=f(I)
    x = I(1);
    y = I(2);
  a = (1-x)*(1-x) + 100*(y-x*x)*(y-x*x);
end

function b=derX(I)
    x = I(1);
    y = I(2);
  b = -2*(1-x) - 100*2*(y-x*x)*2*x;
end

function c=derY(I)
    x = I(1);
    y = I(2);
    c = -100*2*(y-x*x)*2*x;
end