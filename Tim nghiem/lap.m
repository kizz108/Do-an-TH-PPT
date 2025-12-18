function [x1, n]=lap(fx, fp, a, b, saiso) 
n = 0;
fpi = str2func(['@(x)', fp]);
x0 = a;
for i = 1:2000
    x1 = fpi(x0);
    n = n + 1;
    if abs(x1 - x0) < saiso
        break;
    end
    x0 = x1;
end
end
