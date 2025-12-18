<<<<<<< HEAD
function result = NewtonForm(xa, da, x) 
n = length(da); 
result = da(n); 
for i = n-1:-1:1 
result = result * (x - xa(i)) + da(i); 
end 
=======
function result = NewtonForm(xa, da, x) 
n = length(da); 
result = da(n); 
for i = n-1:-1:1 
result = result * (x - xa(i)) + da(i); 
end 
>>>>>>> a844885bf12d36ce1a848bec0e59372dab4f2d3c
end