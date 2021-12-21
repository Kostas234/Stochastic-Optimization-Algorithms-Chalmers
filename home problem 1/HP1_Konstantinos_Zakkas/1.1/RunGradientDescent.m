function minimum = RunGradientDescent(startingPoint, mu, stepLength, threshold)
  
  gradient = ComputeGradient(startingPoint(1), startingPoint(2), mu);
  while norm(gradient)>threshold
    newPoint = startingPoint - stepLength*ComputeGradient(startingPoint(1), startingPoint(2),mu);
    startingPoint = newPoint;
    gradient = ComputeGradient(startingPoint(1), startingPoint(2), mu);
  end
  format short g;
  minimum = round(newPoint, 3);

end
