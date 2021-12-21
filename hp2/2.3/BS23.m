clear all;

populationSize = 100;
crossoverProbability = 0.20;
creepMutationProbability = 0.80;
creepRate = 0.005;
tournamentSelectionParameter = 0.75;
tournamentSize = 2;
numberOfGenerations = 300;
trainingFitness = zeros(populationSize,1);
validationFitness = zeros(populationSize,1);
copiesOfBestIndividual = 1;
numOfInputs = 3;
numOfOutputs = 2;
numOfNeurons = 7;
numOfInputWeights = (numOfInputs+1)*numOfNeurons;
numOfOutputWeights = (numOfNeurons+1)*numOfOutputs;
numberOfGenes = numOfInputWeights+numOfOutputWeights;
mutationProbability = 1/numberOfGenes;
weightRange = [-10 10];
mutationWeightRange = [-10 10];
iTrainingDataSet = 1;
iValidationDataSet = 2;
iTestDataSet = 3;
holdoutNum = 0;
holdoutNumMax = 500;

population = InitializePopulation(populationSize,numberOfGenes,weightRange);

figure;
hold on;
xlabel('Number of Evaluated Generations');
ylabel('Fitness Value');
trainingFitnessPlot = plot(1:numberOfGenerations, zeros(1, numberOfGenerations));
validationFitnessPlot = plot(1:numberOfGenerations, zeros(1, numberOfGenerations));
legend('Training', 'Validation');
hold off;

for iGeneration = 1:numberOfGenerations
  
  maximumTrainingFitness = 0.0;
  maximumValidationFitness = 0.0;
  bestTrainingChromosome = zeros(1, numberOfGenes);
  bestValidationChromosome = zeros(1, numberOfGenes);
  for i = 1:populationSize
    chromosome = population(i,:);
    individual = DecodeChromosome(chromosome, numOfInputs, numOfOutputs);
    trainingFitness(i) = EvaluateIndividual(individual, iTrainingDataSet);
    validationFitness(i) = EvaluateIndividual(individual, iValidationDataSet);
    if (trainingFitness(i) > maximumTrainingFitness)
      maximumTrainingFitness = trainingFitness(i);
      bestTrainingChromosome = individual;
      bestIndividualIndex = i;
    end
    if (validationFitness(i) > maximumValidationFitness)
      maximumValidationFitness = validationFitness(i);
      bestValidationChromosome = individual;
      holdoutNum = 0;
    else
      holdoutNum = holdoutNum+1;
      if holdoutNum>=holdoutNumMax
        break;
      end
    end
  end

  tempPopulation = population;

  for i = 1:2:populationSize
    i1 = TournamentSelect(trainingFitness,tournamentSelectionParameter, tournamentSize);
    i2 = TournamentSelect(trainingFitness,tournamentSelectionParameter, tournamentSize);
    chromosome1 = population(i1,:);
    chromosome2 = population(i2,:);
    
    r = rand;
    if (r < crossoverProbability)
      newChromosomePair = Cross(chromosome1,chromosome2);
      tempPopulation(i,:) = newChromosomePair(1,:);
      tempPopulation(i+1,:) = newChromosomePair(2,:);
    else
      tempPopulation(i,:) = chromosome1;
      tempPopulation(i+1,:) = chromosome2;
    end
  end

  for i = 1:populationSize
    originalChromosome = tempPopulation(i,:);
    mutatedChromosome = Mutate(originalChromosome,mutationProbability, creepMutationProbability,...
        creepRate, mutationWeightRange);
    tempPopulation(i,:) = mutatedChromosome;
  end
  
  bestIndividual = population(bestIndividualIndex,:);
  population = InsertBestIndividual(tempPopulation, bestIndividual, copiesOfBestIndividual); 
  
  plotTrainingPlotValues= get(trainingFitnessPlot, 'YData');
  plotValidationPlotValues = get(validationFitnessPlot, 'YData');
  plotTrainingPlotValues(iGeneration) = maximumTrainingFitness;
  plotValidationPlotValues(iGeneration) = validationFitness(i);
  set(trainingFitnessPlot, 'YData', plotTrainingPlotValues);
  set(validationFitnessPlot, 'YData', plotValidationPlotValues);
  drawnow;
   
end
