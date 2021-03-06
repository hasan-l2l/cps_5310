%% Quadratic Polynomial Regression Method
clear all
close all
clc

% Popultation data
years = 0:2:48;
H     = [.3 .85 14.8 .6 .9 2.5 5.0 9.0 7.0 1.0 1.1 4.2 13.0 5.0 1.8 4.0 7.8 3.5 .5 1.0 .5 5.8 3.6 2.3 3.0];
L     = [.3 1.8 4.3 6.2 1.0 .8 3.0 4.7 4.2 1.2 1.3 3.5 7.2 3.0 2.2 1.5 4.0 3.6 2.3 .8 1.0 2.0 5.8 4.0 1.0];

% Main Code
f = @(p,t) p(1)*(t.^2)-p(2)*t+p(3);
f_= @(q,t) q(1)*(t.^2)-q(2)*t+q(3);

p = [1 2 3];
q = [1 2 3];

[p ,error] = lsqcurvefit(f,p,years,H);
[q ,error1]= lsqcurvefit(f_,q,years,L);

y_H = f(p,years);
y_L = f(q,years);

fprintf('co-efficients for H are')
fprintf ('\na = %f\tb = %f\tc = %f\n',p(:,1),p(:,2),p(:,3))

fprintf('\nco-efficients for L are')
fprintf ('\nx = %f\ty = %f\tz = %f\n',q(:,1),q(:,2),q(:,3))
