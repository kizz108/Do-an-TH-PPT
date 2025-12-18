function I = TichPhanHinhThang(input1, input2, input3, input4)
% TICH PHAN HINH THANG
% Cach 1: TichPhanHinhThang(fx, a, b, N)
% Cach 2: TichPhanHinhThang(x, y)

    %% ===== XAC DINH KIEU DU LIEU =====
    if isa(input1,'function_handle')
        % ===== NHAP HAM SO =====
        fx = input1;
        a  = input2;
        b  = input3;
        N  = input4;

        h = (b - a)/N;
        x = a:h:b;
        y = fx(x);

    else
        % ===== NHAP MANG x, y =====
        x = input1;
        y = input2;

        N = length(x) - 1;
        h = x(2) - x(1);   % gia su x cach deu
    end

    %% ===== CONG THUC HINH THANG =====
    sum_mid = 0;
    for i = 2:N
        sum_mid = sum_mid + y(i);
    end

    I = (h/2) * ( y(1) + y(end) + 2*sum_mid );
end
