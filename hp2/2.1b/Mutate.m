function mutatedChromosome = Mutate(chromosome,mutationProbability)

  nGenes = size(chromosome,2);
  mutatedChromosome = chromosome;
  for j = 1:nGenes
    r = rand;
    if (r < mutationProbability)
      while true
        randGene = randi([1,nGenes]);
        if randGene ~= j
          break
        end
      end
      mutatedGene = mutatedChromosome(j);
      mutatedChromosome(j) = mutatedChromosome(randGene);
      mutatedChromosome(randGene) = mutatedGene;
    end
  end

end