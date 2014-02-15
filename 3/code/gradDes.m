
  
function gradDes(Eth, In, e,M) 
    myfunc = reqF
    fval = myfunc.f(In);
    i=0;
    prevGradX = 0.01;
    prevGradY =0.01;
    prevError = fval;
    eta =e
    
    while abs(fval) > Eth
        gradX = myfunc.derX(In);
        gradY = myfunc.derY(In);
        disp(gradX)
        disp(gradY)
        %grad = grad/abs(grad);
        %size(grad)
        
        i =i+1;
       
        In(1) = In(1) - gradX*eta/sqrt(gradX*gradX + gradY*gradY) - M*prevGradX/sqrt(prevGradX*prevGradX + prevGradY*prevGradY);
        In(2) = In(2) - gradY*eta/sqrt(gradX*gradX + gradY*gradY) - M*prevGradY/sqrt(prevGradX*prevGradX + prevGradY*prevGradY);
        
        fval = myfunc.f(In);
        error = fval
        if(prevError>error)
            eta =eta +eta*0.05;
        else
            eta/2;
            
        prevGradX = gradX;
        prevGradY = gradY;
        disp(fval)
    end
    disp(fval);
    disp(i);
end
        