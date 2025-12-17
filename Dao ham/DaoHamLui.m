function df = DaoHamLui(input1, input2, x0, loai_sai_so)
    % loai_sai_so: 1 là O(h), 2 là O(h^2)
    if isnumeric(input1) && length(input1) > 1
        % --- TRƯỜNG HỢP 1: DỮ LIỆU BẢNG ---
        xa = input1; ya = input2;
        idx = find(xa == x0, 1);
        if isempty(idx), error('Không tìm thấy giá trị x trong bảng dữ liệu!'); end
        h = xa(2) - xa(1);
        if loai_sai_so == 1
            % Sai số O(h): (f(x) - f(x-h)) / h
            if idx < 2, error('Xấp xỉ Lùi O(h) cần ít nhất 1 điểm phía trước.'); end
            df = (ya(idx) - ya(idx-1)) / (xa(idx) - xa(idx-1));
        else
            % Sai số O(h^2): (3f(x) - 4f(x-h) + f(x-2h)) / 2h
            if idx < 3, error('Xấp xỉ Lùi O(h^2) cần ít nhất 2 điểm phía trước.'); end
            df = (3*ya(idx) - 4*ya(idx-1) + ya(idx-2)) / (2*h);
        end
    else
        % --- TRƯỜNG HỢP 2: HÀM SỐ ---
        ham_str = input1; h = input2;
        if isa(ham_str, 'function_handle')
            f = ham_str;
        else
            f = str2func(['@(x) ' ham_str]);
        end
        if loai_sai_so == 1
            % Sai số O(h)
            df = (f(x0) - f(x0 - h)) / h;
        else
            % Sai số O(h^2)
            df = (3*f(x0) - 4*f(x0 - h) + f(x0 - 2*h)) / (2*h);
        end
    end
end