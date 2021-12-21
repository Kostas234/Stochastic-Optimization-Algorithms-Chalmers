function x = DecodeChromosome(chromosome, variablesNumber, variableRange)
  
  chromosomeLength = size(chromosome,2);
  genesPerVariable = chromosomeLength/variablesNumber;
  x = zeros(1, variablesNumber);
  geneIncrement = 0;
  
  for i = 1:variablesNumber
    for j = 1:genesPerVariable
      x(i) = x(i) + chromosome(j+geneIncrement)*2^(-j);
    end
    x(i) = -variableRange + 2*variableRange*x(i)/(1-2^(-genesPerVariable));
    geneIncrement = geneIncrement+genesPerVariable;
  end
  
end