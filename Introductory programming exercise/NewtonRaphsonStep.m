function step = NewtonRaphsonStep(value, firstDerivative, secondDerivative)
  
  if secondDerivative == 0 | isempty(secondDerivative)==0
    disp("Second derivative can not be zero");
    return
  end
  step = value - ((Polynomial(value, firstDerivative))/(Polynomial(value,secondDerivative)));

end
