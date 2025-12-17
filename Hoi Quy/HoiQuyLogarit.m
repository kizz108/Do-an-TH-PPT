function model = HoiQuyLogarit(x, y)

    n = length(x);

    if any(x <= 0)
        error('Hoi quy logarit yeu cau x > 0');
    end

    X = log(x);
    Y = y;

    sumX = 0; sumY = 0; sumXY = 0; sumX2 = 0;

    for i = 1:n
        sumX  = sumX  + X(i);
        sumY  = sumY  + Y(i);
        sumXY = sumXY + X(i)*Y(i);
        sumX2 = sumX2 + X(i)*X(i);
    end

    Xm = sumX / n;
    Ym = sumY / n;

    b = (n*sumXY - sumX*sumY) / (n*sumX^2 - sumX^2);
    a = Ym - b * Xm;

    st = 0; sr = 0;

    for i = 1:n
        st = st + (Y(i) - Ym)^2;
        sr = sr + (Y(i) - (a + b*X(i)))^2;
    end

    r2 = (st - sr) / st;

    model.a  = a;
    model.b  = b;
    model.r2 = r2;
end
