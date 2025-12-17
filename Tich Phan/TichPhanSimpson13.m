function I = TichPhanSimpson13(input1, input2, input3, input4)
% TICH PHAN SIMPSON 1/3
% Cach 1: TichPhanSimpson13(fx, a, b, N)
% Cach 2: TichPhanSimpson13(x, y)

    %% ===== XAC DINH KIEU DU LIEU =====
    if isa(input1,'function_handle')
        % ===== NHAP HAM SO =====
        fx = input1;
        a  = input2;
        b  = input3;
        N  = input4;

        if mod(N,2) ~= 0
            error('N phai la so chan cho Simpson 1/3');
        end

        h = (b - a)/N;
        x = a:h:b;
        y = fx(x);

    else
        % ===== NHAP MANG x, y =====
        x = input1;
        y = input2;

        N = length(x) - 1;

        if mod(N,2) ~= 0
            error('N = length(x)-1 phai la so chan cho Simpson 1/3');
        end

        h = x(2) - x(1);   % gia su x cach deu
    end

    %% ===== CONG THUC SIMPSON 1/3 =====
    sum_le = 0;    % he so 4
    for i = 2:2:N
        sum_le = sum_le + y(i);
    end

    sum_chan = 0;  % he so 2
    for i = 3:2:N-1
        sum_chan = sum_chan + y(i);
    end

    I = (h/3) * ( y(1) + y(end) + 4*sum_le + 2*sum_chan );
end
