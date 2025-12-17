function I = TichPhanSimpson38(input1, input2, input3, input4)
% TICH PHAN SIMPSON 3/8
% - Cach 1: TichPhanSimpson38(fx, a, b, N)
% - Cach 2: TichPhanSimpson38(x, y)

    %% ===== PHAN 1: XAC DINH KIEU DU LIEU =====
    if isa(input1, 'function_handle')
        % ===== NHAP HAM SO =====
        fx = input1;
        a  = input2;
        b  = input3;
        N  = input4;

        if mod(N,3) ~= 0
            error('N phai chia het cho 3');
        end

        h = (b - a) / N;

        % tao vector x
        x = a:h:b;

        % tinh y
        y = fx(x);

    else
        % ===== NHAP MANG x, y =====
        x = input1;
        y = input2;

        N = length(x) - 1;

        if mod(N,3) ~= 0
            error('So khoang N = length(x)-1 phai chia het cho 3');
        end

        % buoc luoi (gia su x cach deu)
        h = x(2) - x(1);
    end

    %% ===== PHAN 2: CONG THUC SIMPSON 3/8 =====
    sum3 = 0;   % he so 3
    for i = 2:N
        if mod(i-1,3) ~= 0
            sum3 = sum3 + y(i);
        end
    end

    sum2 = 0;   % he so 2
    for i = 4:3:N
        sum2 = sum2 + y(i);
    end

    I = (3*h/8) * ( y(1) + y(end) + 3*sum3 + 2*sum2 );
end
