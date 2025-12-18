function model = HoiQuyLogarit(x, y)
    if any(x <= 0)
        error('Hoi quy logarit yeu cau x > 0');
    end
    
    n = length(x);
    X = log(x); % Chuyển x sang logarit
    Y = y;

    % Sử dụng tính toán vector để chính xác và nhanh hơn
    sumX  = sum(X);
    sumY  = sum(Y);
    sumXY = sum(X .* Y);
    sumX2 = sum(X.^2);

    % Công thức tính b và a chuẩn
    b = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX^2);
    a = (sumY - b * sumX) / n;

    % Tính hệ số tương quan R^2
    Y_pred = a + b * X;
    Y_mean = mean(Y);
    st = sum((Y - Y_mean).^2);
    sr = sum((Y - Y_pred).^2);
    r2 = (st - sr) / st

    model.a  = a;
    model.b  = b;
    model.r2 = r2;
end