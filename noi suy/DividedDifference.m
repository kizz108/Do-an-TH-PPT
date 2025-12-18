<<<<<<< HEAD
function d = DividedDifference(xa, ya) 
n = length(ya); 
d_table = zeros(n, n); 
d_table(:, 1) = ya(:);  
for j = 2:n 
for i = 1:n-j+1 
d_table(i, j) = (d_table(i+1, j-1) - d_table(i, j-1)) / (xa(i+j-1) - xa(i)); 
end 
end 
d = d_table(1, :); 
=======
function d = DividedDifference(xa, ya) 
n = length(ya); 
d_table = zeros(n, n); 
d_table(:, 1) = ya(:);  
for j = 2:n 
for i = 1:n-j+1 
d_table(i, j) = (d_table(i+1, j-1) - d_table(i, j-1)) / (xa(i+j-1) - xa(i)); 
end 
end 
d = d_table(1, :); 
>>>>>>> a844885bf12d36ce1a848bec0e59372dab4f2d3c
end