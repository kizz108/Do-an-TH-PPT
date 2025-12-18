function model = HoiQuyMu_e(x, y)
% Hồi quy hàm mũ (lũy thừa): y = a*x^b

    n = length(x);

    % Tuyến tính hóa
    X = log10(x);
    Y = log10(y);

    sumX  = 0;
    sumY  = 0;
    sumXY = 0;
    sumX2 = 0;

    for i = 1:n
        sumX  = sumX  + X(i);
        sumY  = sumY  + Y(i);
        sumXY = sumXY + X(i)*Y(i);
        sumX2 = sumX2 + X(i)*X(i);
    end

    Xm = sumX / n;
    Ym = sumY / n;

    A1 = (n*sumXY - sumX*sumY) / (n*sumX2 - sumX^2);
    A0 = Ym - A1*Xm;

    % Tham số mô hình
    a = 10^A0;
    b = A1;

    % Tính r^2
    st = 0;
    sr = 0;

    for i = 1:n
        st = st + (Y(i) - Ym)^2;
        sr = sr + (Y(i) - (A1*X(i) + A0))^2;
    end

    r2 = (st - sr) / st;

    model.a  = a;
    model.b  = b;
    model.r2 = r2;
    model.type = 'y = a*x^b';
end
