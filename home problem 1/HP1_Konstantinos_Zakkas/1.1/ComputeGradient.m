function gradient = ComputeGradient(x1, x2, mu)
  if x1^2+x2^2-1>=0
    gradient = [2*(x1-1)+4*mu*(x1^3+x1*x2^2-x1) 4*(x2-2)+4*mu*(x2^3+x1^2*x2-x2)];
  else
    gradient = [2*(x1-1) 4*(x2-2)];
  end
end