clear all;

populationSize = 100;
cityLocations = LoadCityLocations;
numberOfCities = size(cityLocations,1);
numberOfGenerations = 1000;
fitness = zeros(populationSize,1);
tournamentSize = 2;
tournamentSelectionParameter = 0.75;
mutationProbability = 1/numberOfCities;
copiesOfBestIndividual = 1;
connection = InitializeConnections(cityLocations);
prevMaximumFitness = 0.0;

for runs = 1:15

  population = InitializePopulation(populationSize, numberOfCities);
    
  for iGeneration = 1:numberOfGenerations

    maximumFitness = 0.0;
    bestPath = zeros(1, numberOfCities);
    bestIndividualIndex = 0;
    for i = 1:populationSize
      chromosome = population(i,:);
      fitness(i) = EvaluateIndividual(chromosome);
      if (fitness(i) > maximumFitness)
        maximumFitness = fitness(i);
        bestIndividualIndex = i;
        bestPath = chromosome;
      end
    end
  
    tempPopulation = population;

    for i = 1:2:populationSize
      i1 = TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
      i2 = TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
      chromosome1 = population(i1,:);
      chromosome2 = population(i2,:);
      tempPopulation(i,:) = chromosome1;
      tempPopulation(i+1,:) = chromosome2;
    end
  
    for i = 1:populationSize
      originalChromosome = tempPopulation(i,:);
      mutatedChromosome = Mutate(originalChromosome, mutationProbability);
      tempPopulation(i,:) = mutatedChromosome;
    end
  
    bestIndividual = population(bestIndividualIndex,:);
    population = InsertBestIndividual(tempPopulation, bestIndividual, copiesOfBestIndividual); 
  
  end
  
  if maximumFitness>prevMaximumFitness
    prevMaximumFitness = maximumFitness;
    theBestPath = bestPath;
    tspFigure = InitializeTspPlot(cityLocations,[0 20 0 20]);
    PlotPath(connection,cityLocations,bestPath);
  end
  
end

disp('Shortest path:')
disp(theBestPath);
disp('Distance:');
disp(round(1/prevMaximumFitness,4));