function [x1, n] = tieptuyen(fx, a, b, saiso)
    syms x;
    f = str2func(['@(x)', fx]);       
    df = matlabFunction(diff(str2sym(fx), x));  
    
    f2 = matlabFunction(diff(diff(str2sym(fx), x))); 
    if f(a) * f2(a) > 0
        x0 = a;
    else
        x0 = b;
    end
    
    n = 0;
    while true
        n = n + 1;
        x1 = x0 - f(x0) / df(x0);  
        if abs(x1 - x0) < saiso
            break;
        end
        x0 = x1;

        if df(x0) == 0
            warning('Đạo hàm bằng 0 tại x = %.6f, phương pháp dừng.', x0);
            break;
        end
    end
end
