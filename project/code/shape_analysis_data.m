function shape_analysis_data_hand(shapes,method)

    
    shapes1 = shapes'
   
    X = shapes1(:,1:56);
    X = X'
    Y = shapes1(:,57:112);
    Y = Y'
    
    n = 56;
    no_of_samples = 40;
    I = zeros(56:2:40);
    I(:,1,:) = X;
    I(:,2,:) = Y;
    hold on
    for i = 1:no_of_samples,
       plot(I(:,1,i),I(:,2,i),'r+');
    end
    
    meanShape = zeros(n,2);
    Scaled =0;
    
    if (method ==0)
        [meanShape,Scaled] = multi_procrustes(I,n,no_of_samples);
        plot(meanShape(:,1),meanShape(:,2),'b*');
    elseif(method ==1)
        meanShape = tangent_space_projection(I,n,no_of_samples);
        plot(meanShape(:,1),meanShape(:,2),'b*');
    else
        Y = pca(I,100,no_of_samples)
    end
    
    
    %compute the variance 
    [V,D] = pca(meanShape,Scaled,n,no_of_samples);
    
    
    
