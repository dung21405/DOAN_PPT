function [a, b, y_fit, eqn] = regressionExp(x, y)
% regressionExp - Hồi quy hàm mũ y = a * e^(b*x)

    % ===== 1. KIỂM TRA DỮ LIỆU =====
    if any(y <= 0)
        error('Với hồi quy hàm mũ, mọi giá trị y phải > 0');
    end

    if length(x) ~= length(y)
        error('x và y phải cùng số phần tử');
    end

    % ===== 2. TUYẾN TÍNH HÓA =====
    % ln(y) = ln(a) + b*x
    X = x(:);          % đảm bảo vector cột
    Y = log(y(:));

    n = length(X);

    % ===== 3. TÍNH HỆ SỐ THEO BÌNH PHƯƠNG TỐI THIỂU =====
    sumX  = sum(X);
    sumY  = sum(Y);
    sumXY = sum(X .* Y);
    sumX2 = sum(X.^2);

    b = (n*sumXY - sumX*sumY) / (n*sumX2 - sumX^2);
    A = (sumY - b*sumX) / n;   % A = ln(a)

    % ===== 4. ĐỔI NGƯỢC =====
    a = exp(A);

    % ===== 5. GIÁ TRỊ KHỚP =====
    y_fit = a * exp(b * X);

    % ===== 6. CHUỖI PHƯƠNG TRÌNH HIỂN THỊ =====
    eqn = sprintf('y = %.6g * e^{%.6g x}', a, b);
end
