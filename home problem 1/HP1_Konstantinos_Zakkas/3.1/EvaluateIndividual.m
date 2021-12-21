function fitness = EvaluateIndividual(x)
  
  fDenominator1 = (x(1)+x(2)+1)^2;
  fDenominator2 = 19-14*x(1)+3*x(1)^2-14*x(2)+6*x(1)*x(2)+3*x(2)^2;
  fDenominator3 = (2*x(1)-3*x(2))^2;
  fDenominator4 = 18-32*x(1)+12*x(1)^2+48*x(2)-36*x(1)*x(2)+27*x(2)^2;
  fDenominator5 = 1 + fDenominator1*fDenominator2;
  fDenominator6 = 30 + fDenominator3*fDenominator4;
  fitness = 1/(fDenominator5*fDenominator6); 

end