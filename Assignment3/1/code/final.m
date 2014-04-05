function z = final(In, S, step, beta, gamma,momentum)
disp('Quad Starting');
I1 = gradesc(In, S, step, beta, gamma,'quad' ,momentum);
disp('Huber Starting');
I2 = gradesc(In, S , step, beta, gamma, 'huber',momentum);
disp('G3 Starting');
I3 = gradesc(In, S , step, beta, gamma, 'g3',momentum);


RRMMSEI1 = RRMSE(In,I1);
RRMMSEI2 = RRMSE(In,I2);
RRMMSEI3 = RRMSE(In,I3);
disp('Quad RRMSE ')
disp(RRMMSEI1)
disp('huber RRMSE ')
disp(RRMMSEI2)
disp('g3 RRMSE ')
disp(RRMMSEI3)

imagesc([ abs(In) abs(I1) abs(I2) abs(I3) ]); axis equal tight; pause, close
z =0;

function z = RRMSE(A,B)
X = (abs(A) - abs(B)).^2;
X = sum(X(:));
X = X ^ (1/2);
Y = abs(A)^.2;
Y = sum(Y(:));
Y = Y ^ (0.5);
z = X/Y;













