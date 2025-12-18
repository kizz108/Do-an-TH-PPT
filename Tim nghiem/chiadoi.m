function [c, n] = chiadoi(fx, a ,b ,saiso)
n = 0;
fxi = str2func(['@(x)', fx]);
while true 
c = (a + b)/2;
if(fxi(a)*fxi(c) < 0)
    b = c;
else 
    a = c;
end
n = n + 1;
if abs(b-a) < saiso
    break;
end
end
end
