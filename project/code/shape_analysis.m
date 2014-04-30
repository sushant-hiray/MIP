function shape_analysis(no_of_samples)
    s = 80;
    e = 100;
    phi0 = 0;
    phi90 = pi/2;
    a = s + (s-e).*rand(1,1);
    phi = phi0 + (phi90-phi0).*rand(1,1);
    X0 = 100*rand(1,1);
    Y0 = 100*rand(1,1);
    b = a/8;    
   
    
    I = zeros(100,2,no_of_samples);
    hold on
    for i = 1:no_of_samples,
        a1  =  plotellipse(a,b,X0,Y0,phi);
        %plot(a1(:,1),a1(:,2),'r+');
        size(a1)
        I(:,:,i) = a1;
        a = s + (s-e).*rand(1,1);
        phi = phi0 + (phi90-phi0).*rand(1,1);
        X0 = 100*rand(1,1);
        Y0 = 100*rand(1,1);
        b = a/8;  
    end
    
    
    meanShape = multi_procrustes(I,100,no_of_samples);
    size(meanShape)
    plot(meanShape(:,1),meanShape(:,2),'b*');
    
