function model = HoiQuyHamMu(x, y)
% ----------------------------------------------------
% HOI QUY HAM MU TU DONG
% Tu dong chon mo hinh tot nhat:
%   y = a*exp(b*x)  HOAC  y = a*x^b
%
% INPUT:
%   x, y : du lieu (vector)
%
% OUTPUT (struct model):
%   model.type : 'exp' hoac 'power'
%   model.a    : he so a
%   model.b    : he so b
%   model.r2   : he so xac dinh R^2
% ----------------------------------------------------

    n = length(x);

    % =======================
    % MO HINH 1: y = a*exp(bx)
    % =======================
    r21 = -inf;

    if all(y > 0)
        X1 = x;
        Y1 = log(y);

        sumX = 0; sumY = 0; sumXY = 0; sumX2 = 0;
        for i = 1:n
            sumX  = sumX  + X1(i);
            sumY  = sumY  + Y1(i);
            sumXY = sumXY + X1(i)*Y1(i);
            sumX2 = sumX2 + X1(i)*X1(i);
        end

        Xm = sumX/n;
        Ym = sumY/n;

        b1 = (n*sumXY - sumX*sumY) / (n*sumX2 - sumX^2);
        A01 = Ym - b1*Xm;
        a1 = exp(A01);

        st = 0; sr = 0;
        for i = 1:n
            st = st + (Y1(i) - Ym)^2;
            sr = sr + (Y1(i) - (A01 + b1*X1(i)))^2;
        end
        r21 = (st - sr)/st;
    end

    % =======================
    % MO HINH 2: y = a*x^b
    % =======================
    r22 = -inf;

    if all(x > 0) && all(y > 0)
        X2 = log(x);
        Y2 = log(y);

        sumX = 0; sumY = 0; sumXY = 0; sumX2 = 0;
        for i = 1:n
            sumX  = sumX  + X2(i);
            sumY  = sumY  + Y2(i);
            sumXY = sumXY + X2(i)*Y2(i);
            sumX2 = sumX2 + X2(i)*X2(i);
        end

        Xm = sumX/n;
        Ym = sumY/n;

        b2 = (n*sumXY - sumX*sumY) / (n*sumX2 - sumX^2);
        A02 = Ym - b2*Xm;
        a2 = exp(A02);

        st = 0; sr = 0;
        for i = 1:n
            st = st + (Y2(i) - Ym)^2;
            sr = sr + (Y2(i) - (A02 + b2*X2(i)))^2;
        end
        r22 = (st - sr)/st;
    end

    % =======================
    % CHON MO HINH TOT HON
    % =======================
    if r21 >= r22
        model.type = 'exp';
        model.a = a1;
        model.b = b1;
        model.r2 = r21;
    else
        model.type = 'power';
        model.a = a2;
        model.b = b2;
        model.r2 = r22;
    end
end
