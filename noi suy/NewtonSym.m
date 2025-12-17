function P = NewtonSym(xa, ya) 
syms x; 
n = length(xa); 
d = DividedDifference(xa, ya); 
P = d(1); 
term = 1; 
for i = 2:n 
term = term * (x - xa(i-1)); 
P = P + d(i) * term; 
end  
P = simplify(P); 
end