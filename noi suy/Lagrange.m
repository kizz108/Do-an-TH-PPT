<<<<<<< HEAD
function result = Lagrange(xa, ya, x) 
    n = length(xa); 
    sum = 0;
    for i = 1:n 
        product = ya(i); 
        for j = 1:n 
            if i ~= j 
                product = product * (x - xa(j)) / (xa(i) - xa(j)); 
            end 
        end 
        sum = sum + product; 
    end   
    result = sum; 
=======
function result = Lagrange(xa, ya, x) 
    n = length(xa); 
    sum = 0;
    for i = 1:n 
        product = ya(i); 
        for j = 1:n 
            if i ~= j 
                product = product * (x - xa(j)) / (xa(i) - xa(j)); 
            end 
        end 
        sum = sum + product; 
    end   
    result = sum; 
>>>>>>> a844885bf12d36ce1a848bec0e59372dab4f2d3c
end