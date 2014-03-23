
  
function gradDes(Eth, In, e,M)
    myfunc = reqF;
    figure(1); clf; 
    myF = @(x,y) myfunc.f([x y]);
    %ezcontour(myF, [-3 3],49);
    %plot(ezcontour(myF)); 
    
    ezcontour(myF,[-5 5 -5 5]); 
    axis equal; 
    hold on;
    fval = myfunc.f(In);
    i=0;
    prevGradX = 0.01;
    prevGradY =0.01;
    prevError = fval;
    eta =e;
    X=[];
    Y=[];
    Fval=[];
    while abs(fval) > Eth
        gradX = myfunc.derX(In);
        gradY = myfunc.derY(In);
        %disp(gradX)
        %disp(gradY)
        %grad = grad/abs(grad);
        %size(grad)
        i =i+1;
        Inp = In;
        In(1) = In(1) - (1-M)*eta*gradX/sqrt(gradX*gradX + gradY*gradY)- M*prevGradX/sqrt(prevGradX*prevGradX + prevGradY*prevGradY);
        In(2) = In(2) - (1-M)*eta*gradY/sqrt(gradX*gradX + gradY*gradY)- M*prevGradY/sqrt(prevGradX*prevGradX + prevGradY*prevGradY);
        
        fval = myfunc.f(In);
        error = abs(fval);
        if(prevError>error)
            eta =eta*1.05 ;
        else
            eta = eta*0.9;
        end
        
        X =[X In(1)];
        Y =[Y In(2)];
        Fval = [Fval fval];
        prevGradX = gradX;
        prevGradY = gradY;
        %disp(fval)
        % plot current point
        %plot([Inp(1) In(1)],[Inp(2) In(2)],'-')
        refresh% plot current point
        Inp = In;
        prevError = error;
        
    end
    disp(fval);
    disp(i);
    plot3(X,Y,Fval)
end
        