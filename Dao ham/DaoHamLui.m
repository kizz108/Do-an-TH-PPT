function df = DaoHamLui(input1, input2, input3, input4)
% DAO HAM LUI (BACKWARD DIFFERENCE)
% Cach 1: DaoHamLui(ham_so, h, x0, sai_so)
% Cach 2: DaoHamLui(x, y, x0, sai_so)

    %% ===== XAC DINH KIEU DU LIEU & CHUAN BI BIEN =====
    x0 = input3;
    loai_sai_so = input4;
    
    % Bien luu: y0=f(x), y_1=f(x-h), y_2=f(x-2h)
    y0 = 0; y_1 = 0; y_2 = 0;
    h = 0;

    if isnumeric(input1) && length(input1) > 1
        % ----- DU LIEU BANG -----
        xa = input1; ya = input2;
        idx = find(xa == x0, 1);
        if isempty(idx), error('Khong tim thay x trong du lieu!'); end
        
        h = xa(2) - xa(1);
        
        if idx < 2
            error('Khong du diem phia truoc de tinh dao ham Lui O(h)');
        end
        
        y0 = ya(idx);
        y_1 = ya(idx-1);
        
        if loai_sai_so == 2
            if idx < 3
                error('Khong du diem phia truoc de tinh dao ham Lui O(h^2)');
            end
            y_2 = ya(idx-2);
        end
        
    else
        % ----- HAM SO -----
        ham_str = input1; h = input2;
        if isa(ham_str, 'function_handle'), f = ham_str; else, f = str2func(['@(x) ' ham_str]); end
        
        y0 = f(x0);
        y_1 = f(x0 - h);
        if loai_sai_so == 2
            y_2 = f(x0 - 2*h);
        end
    end

    %% ===== CONG THUC DAO HAM LUI =====
    if loai_sai_so == 1
        % Sai so O(h): (y(i) - y(i-1)) / h
        df = (y0 - y_1) / h;
    else
        % Sai so O(h^2): (3y(i) - 4y(i-1) + y(i-2)) / 2h
        df = (3*y0 - 4*y_1 + y_2) / (2*h);
    end
end