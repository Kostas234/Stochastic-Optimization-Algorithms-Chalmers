clear all;

polynomialCoeficients = [10 -2 -1 1];
startingPoint = 2;
tolerance = 0.0001;
if length(polynomialCoeficients)<3
  disp("The second derivative of the vector is zero so the NewtonRaphson function can not be executed");
  return
end
iterationValues = NewtonRaphson(polynomialCoeficients, startingPoint, tolerance);
PlotIterations(polynomialCoeficients, iterationValues);