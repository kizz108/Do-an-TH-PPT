function I = TichPhanSimpson13(fx, a, b, N)
% N phải là số chẵn
h = (b - a) / N;

sum_le = 0;
for i = 1:2:N-1
    sum_le = sum_le + fx(a + i*h);
end

sum_chan = 0;
for i = 2:2:N-2
    sum_chan = sum_chan + fx(a + i*h);
end

I = (h/3) * (fx(a) + fx(b) + 4*sum_le + 2*sum_chan);
end
