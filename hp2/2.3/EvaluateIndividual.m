function fitness = EvaluateIndividual(individual, iDataSet)

  if iDataSet == 1
    numOfSlopes = 10;
  elseif iDataSet == 2 || 3
    numOfSlopes = 5;
  end
  
  distance = 0;
  totalSlopeFitness = 0;
  
  for iSlope=1:numOfSlopes
      
    [distances, speeds] = truckModel(individual, iDataSet, iSlope);
    distancesSize = size(distances,2);
    distance = distances(distancesSize);
    averageSpeed = mean(speeds);
    slopeFitness = averageSpeed*distance;
    
    totalSlopeFitness = totalSlopeFitness + slopeFitness;
  end
  
  fitness = totalSlopeFitness/numOfSlopes;

end