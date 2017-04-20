%% Central Difference Approximation Method
clear all
close all
clc

% Popultation data
years    = [1862:2:1910];
H     = [.3 .85 14.8 .6 .9 2.5 5.0 9.0 7.0 1.0 1.1 4.2 13.0 5.0 1.8 4.0 7.8 3.5 .5 1.0 .5 5.8 3.6 2.3 3.0];
L     = [.3 1.8 4.3 6.2 1.0 .8 3.0 4.7 4.2 1.2 1.3 3.5 7.2 3.0 2.2 1.5 4.0 3.6 2.3 .8 1.0 2.0 5.8 4.0 1.0];

% Main Code
for i = 2:24
    M(i-1) = (H(i+1)-H(i-1))/(H(i)*(years(i+1)-years(i-1)));
    m(i-1) = L(i);
    N(i-1) = (L(i+1)-L(i-1))/(L(i)*(years(i+1)-years(i-1)));
    n(i-1) = H(i);
end

X = polyfit(M,m,1);
Y = polyfit(N,n,1);
p = [X(1) X(2) Y(1) Y(2)];

[t,y] = ode45(@(t,y) lv_rhs(t,y,p),years,[H(1);L(1)]);
fprintf ('\na = %f\tb = %f\tr = %f\tc = %f\n',X(1),X(2),Y(1),Y(2))


% Plot Information
plot(years,H,'g',years,L,'r',t,y,'b')
legend('Hare','Lynx','[t,y]','location','Northeast')
