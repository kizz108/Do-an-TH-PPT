function P = LagrangeSym(xa, ya)    
syms x; 
n = length(xa); 
P = 0; 
for i = 1:n 
L = 1;  
for j = 1:n 
if i ~= j 
L = L * (x - xa(j)) / (xa(i) - xa(j)); 
end 
end 
P = P + ya(i) * L; 
end 
P = simplify(P); 
end