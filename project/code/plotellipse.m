% input ellipse parameters
function y = plotellipse(a,b,X0,Y0,phi)
% a- major axis, b - minor axis, X0 - X-coord of center, 
% Y0 - Y-coord of center, phi - rotation angle. 
theta_grid = linspace(0,2*pi);
% the ellipse in x and y coordinates 
ellipse_x_r  = X0 + a*cos( theta_grid );
ellipse_y_r  = Y0 + b*sin( theta_grid );

%Define a rotation matrix
R = [ cos(phi) sin(phi); -sin(phi) cos(phi) ];

%let's rotate the ellipse to some angle phi
r_ellipse = R * [ellipse_x_r;ellipse_y_r];

y = r_ellipse';

% plot using the following command:
% plot(r_ellipse(1,:),r_ellipse(2,:),'+r')