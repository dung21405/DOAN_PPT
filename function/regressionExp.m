function [a, b, y_fit, eqn] = regressionExp(x, y)
% Hồi quy hàm mũ y = a * e^(b*x)
    if any(y <= 0)
        error('y phải > 0 để tính logarit');
    end
    
    % Tuyến tính hóa: Y = ln(y), X = x
    % PT trở thành: Y = A + b*X (với A = ln(a))
    X = x;
    Y = log(y); 
    n = length(x);
    
    sumX  = sum(X);
    sumY  = sum(Y);
    sumXY = sum(X .* Y);
    sumX2 = sum(X .^ 2);
    
    % Tính b và A
    b = (n*sumXY - sumX*sumY) / (n*sumX2 - sumX^2);
    A = (sumY - b*sumX) / n;
    
    % Chuyển ngược lại tìm a
    a = exp(A);
    
    % Tính giá trị khớp
    y_fit = a * exp(b * x);
    eqn = sprintf('y = %.4f * e^{%.4f * x}', a, b);
end