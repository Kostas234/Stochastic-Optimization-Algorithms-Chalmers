function positions = InitializePopulation(populationSize, numberOfVariables, range)

  positions = zeros(populationSize, numberOfVariables);
  rangeSize = size(range,2);
  
  for i=1:populationSize
    for j = 1:numberOfVariables
      positions(i, j) = range(1) + rand*(range(rangeSize)-range(1));  
    end
  end
  
end