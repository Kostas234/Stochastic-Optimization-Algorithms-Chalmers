function polynomialValue = Polynomial(value, vector)
  
  polynomialValue = vector(1);
  for i = 2:length(vector)
    polynomialValue = polynomialValue + vector(i)*(value^(i-1));
  end
  
end