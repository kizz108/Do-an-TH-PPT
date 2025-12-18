function df = DaoHamTrungTam(input1, input2, input3, input4)
% DAO HAM TRUNG TAM (CENTRAL DIFFERENCE)
% Cach 1: DaoHamTrungTam(ham_so, h, x0, sai_so)
% Cach 2: DaoHamTrungTam(x, y, x0, sai_so)

    %% ===== XAC DINH KIEU DU LIEU & CHUAN BI BIEN =====
    x0 = input3;
    % loai_sai_so = input4; % Phuong phap nay mac dinh la O(h^2)
    
    % Bien luu: y_1=f(x-h), y1=f(x+h)
    y_1 = 0; y1 = 0;
    h = 0;

    if isnumeric(input1) && length(input1) > 1
        % ----- DU LIEU BANG -----
        xa = input1; ya = input2;
        idx = find(xa == x0, 1);
        if isempty(idx), error('Khong tim thay x trong du lieu!'); end
        
        h = xa(2) - xa(1);
        
        if idx == 1 || idx == length(xa)
            error('Can du lieu o ca hai phia (khong tinh duoc tai bien)');
        end
        
        y_1 = ya(idx-1);
        y1  = ya(idx+1);
        
    else
        % ----- HAM SO -----
        ham_str = input1; h = input2;
        if isa(ham_str, 'function_handle'), f = ham_str; else, f = str2func(['@(x) ' ham_str]); end
        
        y_1 = f(x0 - h);
        y1  = f(x0 + h);
    end

    %% ===== CONG THUC DAO HAM TRUNG TAM =====
    % Cong thuc O(h^2): (f(x+h) - f(x-h)) / 2h
    df = (y1 - y_1) / (2*h);
end