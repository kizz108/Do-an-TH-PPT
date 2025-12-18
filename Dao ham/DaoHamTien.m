function df = DaoHamTien(input1, input2, input3, input4)
% DAO HAM TIEN (FORWARD DIFFERENCE)
% Cach 1: DaoHamTien(ham_so, h, x0, sai_so)
% Cach 2: DaoHamTien(x, y, x0, sai_so)

    %% ===== XAC DINH KIEU DU LIEU & CHUAN BI BIEN =====
    x0 = input3;          % Gia tri can tinh
    loai_sai_so = input4; % 1 = O(h), 2 = O(h^2)
    
    % Bien luu cac gia tri y can thiet: y0=f(x), y1=f(x+h), y2=f(x+2h)
    y0 = 0; y1 = 0; y2 = 0; 
    h = 0;

    if isnumeric(input1) && length(input1) > 1
        % ----- TRUONG HOP 1: DU LIEU BANG (MANG SO) -----
        xa = input1; 
        ya = input2;
        
        idx = find(xa == x0, 1);
        if isempty(idx), error('Khong tim thay x trong du lieu!'); end
        
        h = xa(2) - xa(1); % Tinh buoc h tu du lieu
        
        % Kiem tra bien va lay gia tri y
        n = length(xa);
        if idx > n-1
             error('Khong du diem phia sau de tinh dao ham Tien O(h)'); 
        end
        
        y0 = ya(idx);
        y1 = ya(idx+1);
        
        if loai_sai_so == 2
            if idx > n-2
                error('Khong du diem phia sau de tinh dao ham Tien O(h^2)');
            end
            y2 = ya(idx+2);
        end

    else
        % ----- TRUONG HOP 2: HAM SO (STRING/HANDLE) -----
        ham_str = input1;
        h = input2;
        
        % Chuyen chuoi thanh ham
        if isa(ham_str, 'function_handle')
            f = ham_str;
        else
            f = str2func(['@(x) ' ham_str]);
        end
        
        % Tinh cac gia tri y
        y0 = f(x0);
        y1 = f(x0 + h);
        if loai_sai_so == 2
            y2 = f(x0 + 2*h);
        end
    end

    %% ===== CONG THUC DAO HAM TIEN =====
    if loai_sai_so == 1
        % Sai so O(h): (y(i+1) - y(i)) / h
        df = (y1 - y0) / h;
    else
        % Sai so O(h^2): (-3y(i) + 4y(i+1) - y(i+2)) / 2h
        df = (-3*y0 + 4*y1 - y2) / (2*h);
    end
end