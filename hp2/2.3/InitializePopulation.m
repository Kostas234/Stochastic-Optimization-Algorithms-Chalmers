function population = InitializePopulation(populationSize, genesNumber, weightRange)

  population = zeros(populationSize, genesNumber);
  for i = 1:populationSize
    population(i, :) = weightRange(1) + rand(1, genesNumber)*(weightRange(2)-...
        weightRange(1));
  end 

end