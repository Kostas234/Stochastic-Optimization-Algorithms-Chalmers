function pheromoneLevel = InitializePheromoneLevels(numOfCities, tau0)

  pheromoneLevel = zeros(numOfCities, numOfCities) + tau0;

end