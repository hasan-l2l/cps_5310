function [x] = hasan_cg(A,b,x)

%% Conjugate Gradient Method

r   = b-A*x;
p   = r;
rho = r'*r;

    for i = 1:1000
        a = A*p;
        alpha = rho / (p'*a);
        x = x + alpha * p;
        r = r - alpha * a;
        rho_new = r'*r;
        if sqrt(rho_new) < 1e-7
              break;
        end
        p = r + (rho_new/rho) * p;
        rho = rho_new;
    end
end