
clc
clear all
%The next MATLAB script provides the data described on the Hare-Lynx Population table.
%It has been scaled furthermore, it is incomplete. Please fill in all the population values before


%lv_data.m
% Script to store the given LV data
%The H and L values have been scaled to 1000’s.
%The years 1862 to 1910 too, have been scaled to 0:48.

years = 0:2:48;
H     = [.3 .85 14.8 .6 .9 2.5 5.0 9.0 7.0 1.0 1.1 4.2 13.0 5.0 1.8 4.0 7.8 3.5 .5 1.0 .5 5.8 3.6 2.3 3.0];
L     = [.3 1.8 4.3 6.2 1.0 .8 3.0 4.7 4.2 1.2 1.3 3.5 7.2 3.0 2.2 1.5 4.0 3.6 2.3 .8 1.0 2.0 5.8 4.0 1.0];
a = L*10000;
a'
pause


[H';L']


%% Central Difference Approximation
for k = 1:23;
y(k)  = (1/L(k+1))*(L(k+2)-L(k))/2;
x(k)  = H(k+1);
end
% 
%/ Linear Fit
P=polyfit(x,y,1);
L=P(1)*x+P(2);
% Plot Information
plot(x,y,'ro',x,L,'b-','linewidth',1.5)
title('Linear Regression for Predators')
xlabel('x')
ylabel('(1/y)(dy/dt)')
legend('Data','Linear Fit','location','Northwest')
%