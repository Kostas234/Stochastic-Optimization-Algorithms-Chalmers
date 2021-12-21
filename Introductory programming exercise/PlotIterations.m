function plot = PlotIterations(polyCoefficients, iterationValues)
  
 points = [];
 if length(polyCoefficients)<4
  point = Polynomial(iterationValues(1), polyCoefficients);
  roots=roots(flip(polyCoefficients));
  if roots(1)<roots(2)
    iterationValues2=roots(1):10^-4:roots(2);
  else
    iterationValues2 = roots(2):10^-4:roots(1);
  end
  for i = 1:length(iterationValues2)
    points = [points Polynomial(iterationValues2(i), polyCoefficients)];
  end
  figure
  scatter(iterationValues(1),point);
  hold on
  plot(iterationValues2,points, 'Color', 'red');
  hold off
  return
  end

  for i = 1:length(iterationValues)
    points = [points Polynomial(iterationValues(i), polyCoefficients)];
  end
  if iterationValues(1)<iterationValues(length(iterationValues))
    iterationValues2=iterationValues(1):10^-4:iterationValues(length(iterationValues));
  else
    iterationValues2=iterationValues(1):-10^-4:iterationValues(length(iterationValues));
  end
  points2=interp1(iterationValues,points,iterationValues2,'spline');
  figure
  scatter(iterationValues, points, 100, 'LineWidth', 1);
  hold on
  plot(iterationValues2, points2, 'Color', 'red');
  hold off
  xlabel('Iteration Values');
  ylabel('Polynomial Values');

end