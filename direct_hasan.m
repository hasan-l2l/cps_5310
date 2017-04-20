%% Direct Method
clear all
close all
clc

% Popultation data
years = 0:2:48;
H     = [.3 .85 14.8 .6 .9 2.5 5.0 9.0 7.0 1.0 1.1 4.2 13.0 5.0 1.8 4.0 7.8 3.5 .5 1.0 .5 5.8 3.6 2.3 3.0];
L     = [.3 1.8 4.3 6.2 1.0 .8 3.0 4.7 4.2 1.2 1.3 3.5 7.2 3.0 2.2 1.5 4.0 3.6 2.3 .8 1.0 2.0 5.8 4.0 1.0];

% Initial Guess
ig = [-.46; .3; .18; .415];

% Main Code
[p,error]=fminsearch(@lv_E, ig);
[t,y]=ode45(@(t,y) lv_rhs(t,y,abs(p)),years,[H(1);L(1)]);
fprintf ('\na = %f\tb = %f\tr = %f\tc = %f\n',p(1,:),p(2,:),p(3,:),p(4,:))
