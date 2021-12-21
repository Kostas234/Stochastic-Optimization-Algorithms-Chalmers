function g = EvaluateFunction(x)
    f1 = (x(1) + x(2) + 1)^2;
    f2 = (19 - 14 * x(1) + 3 * x(1)^2 - 14 * x(2) + 6 * x(1) * x(2) + 3 * x(2)^2);
    f = 1 + f1 * f2;
    
    h1 = (2 * x(1) - 3 * x(2))^2;
    h2 = (18 - 32 * x(1) + 12 * x(1)^2 + 48 * x(2) - 36 * x(1) * x(2) + 27 * x(2)^2);
    h = 30 + h1 * h2;
    
    g = f * h;
end
