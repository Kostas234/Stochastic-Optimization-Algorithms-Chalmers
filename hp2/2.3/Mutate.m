function mutatedChromosome = Mutate(chromosome,mutationProbability, creepMutationProbability,...
  creepRate, mutationWeightRange)

  nGenes = size(chromosome,2);
  mutatedChromosome = chromosome;
  for i = 1:nGenes
    r = rand;
    if (r < mutationProbability)
      p = rand;
      if p<creepMutationProbability
        newChromosome = chromosome(i) - creepRate/(2+creepRate*rand);
      else
        weightMin = mutationWeightRange(1);
        weightMax = mutationWeightRange(2);
        newChromosome = rand*abs(weightMax-weightMin)+weightMin;
      end
      mutatedChromosome(i) = newChromosome;
    else
      mutatedChromosome(i) = chromosome(i);
    end
  end

end