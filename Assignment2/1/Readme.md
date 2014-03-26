Q1)
a) function y = complex_gaussian(Y,X,sigma) essentially computes the (differentiation of)complex gaussian. The crude version of complex gaussian is found in gradesc.m (function gradesc)
`function z = complex_gaussian_prob(Y,X,sigma,beta)`

b) mrf_quad gives the differential version of the quad potential. The normal version can be found in file gradesc.m 
`function z = mrf_quad_prob(A,beta)`

c) mrf_huber gives the differential version of the huber potential. The normal version can be found in file gradesc.m 
`function z = mrf_huber_prob(A,beta,gamma)`

d) mrf_g3 gives the differential version of the special potential. The normal version can be found in file gradesc.m 
`function z = mrf_g3(A,beta,gamma)`



