

Run using 

gradDes(error,[x,y],eta,momentum)

eg:
    gradDes(0.001,[-3,-4],0.000000001,0.9999)


The apdative gain version, with momentum factor implemented converges to solution faster.

Step size is very critical in case of adaptive if you want to converge at the correct optimal.

for the first method if you choose a very large step size then you might as well not converge will always keep on oscillationg between two points.

So I have chosen step size to be 0.0000001 which is very very small.
Actually step sizes should be chosen keeping in mind the gradients of the function, you trying to converge!.




