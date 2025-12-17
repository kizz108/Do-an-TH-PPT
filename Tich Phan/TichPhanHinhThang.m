function y = TichPhanHinhThang(fx, a, b, N)

h = (b - a) / N;

sum_mid = 0;
for i = 1:N-1
    x_i = a + i*h;
    sum_mid = sum_mid + fx(x_i);
end

y = (h/2) * (fx(a) + fx(b) + 2*sum_mid);
end