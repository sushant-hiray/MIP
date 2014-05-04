function shape_analysis_data_hand(shapes,method)

    
    shapes1 = shapes;
    size(shapes1)   
    X = shapes1(:,1:2:end);
    
    X = X';
    size(X)
    Y = shapes1(:,2:2:end);
    Y = Y';
    
    n = 12;
    no_of_samples = 10;
    I = zeros(12:2:10);
    I(:,1,:) = X;
    I(:,2,:) = Y;
    hold on
    for i = 1:no_of_samples,
       %plot(I(:,1,i),I(:,2,i),'r+');
    end
    
    meanShape = zeros(n,2);
    Scaled =I;
    
    if (method ==0)
        [meanShape,Scaled] = multi_procrustes(I,n,no_of_samples);
        %plot(meanShape(:,1),meanShape(:,2),'b*');
    elseif(method ==1)
        meanShape = tangent_space_projection(I,n,no_of_samples);
        plot(meanShape(:,1),meanShape(:,2),'b*');
    else
        Y = pca(I,100,no_of_samples)
    end
    
    
    %compute the variance 
    [V,D] = pca(meanShape,Scaled,n,no_of_samples);
    [row,col] = find(D == max(abs(D(:))));
    eigenVect1 = V(:,row);
    eigenVect1 = eigenVect1.^0.5;
    
    [x,y] = size(D)
    temp = zeros(y,1);
    temp = temp +1;
    temp = D * temp;
    
    print('max eigen value')
    a =max(D(:));
    %disp('column number is : ' + row);
    eigenDiff = zeros(n,2);
    eigenDiff(:,1) = eigenVect1(1:n);
    eigenDiff(:,2) = eigenVect1(n+1:end);
    meanShape2 = meanShape - eigenDiff;
    meanShape3 = meanShape + eigenDiff;
    size(meanShape3)
    %plot(meanShape2(:,1),meanShape2(:,2),'g*');
    %plot(meanShape3(:,1),meanShape3(:,2),'m*');
    for i=1:3,
        for j=1:3
            if i ==3 && j==3
                continue;
            end
            subplot(3,3,(i-1)*3+j)
            plot(I(:,1,i),I(:,2,i),'r+')
        end
    end
    subplot(3,3,9);
    plot(meanShape(:,1),meanShape(:,2),'b*');
    
    
    
    
    
    
    
