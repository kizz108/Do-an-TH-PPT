function df = DaoHamTrungTam(input1, input2, x0, loai_sai_so)
    % loai_sai_so: Tham số giữ chỗ (Phương pháp Trung tâm mặc định là O(h^2))
    if isnumeric(input1) && length(input1) > 1
        % --- TRƯỜNG HỢP 1: DỮ LIỆU BẢNG ---
        xa = input1; ya = input2;
        idx = find(xa == x0, 1);
        if isempty(idx), error('Không tìm thấy giá trị x trong bảng dữ liệu!'); end
        if idx == 1 || idx == length(xa)
            error('Xấp xỉ Trung tâm cần dữ liệu ở cả hai phía (không tính được tại biên).'); 
        end
        df = (ya(idx+1) - ya(idx-1)) / (xa(idx+1) - xa(idx-1));
    else
        % --- TRƯỜNG HỢP 2: HÀM SỐ ---
        ham_str = input1; h = input2;
        if isa(ham_str, 'function_handle')
            f = ham_str;
        else
            f = str2func(['@(x) ' ham_str]);
        end
        df = (f(x0 + h) - f(x0 - h)) / (2*h);
    end
end