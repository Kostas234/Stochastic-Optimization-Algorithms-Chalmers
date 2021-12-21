function fitness = EvaluateIndividual(positions)
  
  x = positions(1,1);
  y = positions(1,2);
  fitness = (x^2+y-11)^2 + (x+y^2-7)^2;
  
end