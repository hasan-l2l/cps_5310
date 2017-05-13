clc;
close all;
clear all;


%% Main Code
N=100*100;
k=sqrt(N);h=1/k;
A=zeros(N,N);
b=zeros(N,1);

for i=1:N
    for j=1:N
        if(i==j)
            A(i,j)=(4/h^2);
        end
        if((floor(i/k)==floor(j/k)) && abs(i-j)==1)
          A(i,j)=-1/h^2;
        end
        if(abs(i-j)==k)
            A(i,j)=-1/h^2;
        end
    end
end
for i=1:N
    b(i)=1;
end

%% Calling Conjugate Gradient Method 
x=A\b;
y=hasan_cg(A,b,x);
error=norm(x-y,2);

%% Compare the results
fprintf('The difference between cg method and direct method is:') 
error

%% Graph
plot(x);
xlabel('grid points');
ylabel('solution');