function newPopulation = InsertBestIndividual(tempPopulation, bestIndividual, numberOfCopies)

  for i = 1:numberOfCopies
    tempPopulation(i,:) = bestIndividual;
  end
  newPopulation = tempPopulation;
  
end