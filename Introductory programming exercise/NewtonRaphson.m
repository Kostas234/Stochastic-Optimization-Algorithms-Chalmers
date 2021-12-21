function iterateValues = NewtonRaphson(vector,startingPoint,toleranceParam)
  
  if length(vector)<3
    disp("The second derivative of the vector is zero so the iterations can not be found");
    return
  end
  
  iterateValue = startingPoint;
  iterateValues = [];
  while true
    iterateValue = NewtonRaphsonStep(iterateValue, Polynomial(iterateValue,PolynomialDifferentiation(vector,1)),...
    Polynomial(iterateValue,PolynomialDifferentiation(vector,2)));
    iterateValues = [iterateValues iterateValue];
    if abs((Polynomial(iterateValue,PolynomialDifferentiation(vector,1)))/...
      (Polynomial(iterateValue,PolynomialDifferentiation(PolynomialDifferentiation(vector,1),1))))...
      <toleranceParam      
      break      
    end
  end
  
  stationaryPoints = roots(flip(PolynomialDifferentiation(vector,1)));
  optimum = double(stationaryPoints(1));
  difference = abs(abs(iterateValues(length(iterateValues)))-abs(stationaryPoints(1)));
  for i = 1:length(stationaryPoints)
    if abs(abs(iterateValues(length(iterateValues)))-abs(stationaryPoints(i)))<difference
      optimum = stationaryPoints(i);
    end  
  end
  iterateValues = [iterateValues optimum]; 
  
end
