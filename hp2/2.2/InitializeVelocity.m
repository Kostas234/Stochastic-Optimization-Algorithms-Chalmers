function velocity = InitializeVelocity(populationSize, numberOfVariables,...
   range)

  velocity = zeros(populationSize, numberOfVariables);
  rangeSize = size(range,2);
  
  for i=1:populationSize
    for j = 1:numberOfVariables
      velocity(i, j) = -(range(rangeSize)-range(1))/2 + ...
          rand*(range(rangeSize)-range(1));
    end
  end
  
end