function y = TichPhanSimpson38(fx, a, b, N)
% N phai chia het cho 3

h = (b - a) / N;

sum3 = 0;   % he so 3
for i = 1:N-1
    if mod(i,3) ~= 0
        x_i = a + i*h;
        sum3 = sum3 + fx(x_i);
    end
end

sum2 = 0;   % he so 2
for i = 3:3:N-3
    x_i = a + i*h;
    sum2 = sum2 + fx(x_i);
end

y = (3*h/8) * (fx(a) + fx(b) + 3*sum3 + 2*sum2);
end