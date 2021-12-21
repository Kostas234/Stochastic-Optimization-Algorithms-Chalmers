function derivative = PolynomialDifferentiation(vector, derivativeOrder)
 
  if derivativeOrder>=length(vector)
    derivative = 0;
    return
  elseif derivativeOrder==0
    derivative = vector;
    return
  end
  derivative=zeros(1,size(vector,2)-1);
  for i = 1:derivativeOrder
    derivative = [];
    for j = 1:length(vector)-1
      derivativeValue = vector(j+1)*(j);
      derivative(j) = derivativeValue;
    end
    vector = derivative;
  end

end
