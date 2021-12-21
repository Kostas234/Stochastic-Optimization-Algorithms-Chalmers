function individual = DecodeChromosome(chromosome, numOfInputs, numOfOutputs)
    
  numOfNeurons = 7;
  chromosomeLength = length(chromosome);
  
  numOfInputWeights = (numOfInputs+1) * numOfNeurons;
  numOfOutputWeights = (numOfNeurons+1) * numOfOutputs;
   
  inputWeights = chromosome(1:numOfInputWeights);
  inputWeights = reshape(inputWeights, numOfInputs+1, numOfNeurons)';
  outputWeights = chromosome(numOfInputWeights+1:end);
  outputWeights = reshape(outputWeights, numOfNeurons+1, numOfOutputs)';
    
  individual{1} = inputWeights;
  individual{2} = outputWeights;
    
end