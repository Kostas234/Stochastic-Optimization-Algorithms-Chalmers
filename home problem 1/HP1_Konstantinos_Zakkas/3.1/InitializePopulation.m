function population = InitializePopulation(populationSize, genesNumber)
  
  population = zeros(populationSize, genesNumber);
  for i = 1:populationSize
    for j = 1:genesNumber
      r = rand;
      if (r < 0.5)
        population(i,j)=0;
      else
        population(i,j)=1;
      end
    end
  end 
  
end
