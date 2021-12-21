function neuralNetworkOutput = RunTruckModel(speedInput, slopeInput, tempInput, individual)

  inputNeurons = [speedInput; slopeInput; tempInput; 1];
  inputWeights = individual{1};
  outputWeights = individual{2};
    
  % Compute Sigmoidal Membership Function
  for i = 1:7
    hiddenNeurons(i,:) = 1/(1+exp(-1*(inputWeights(i,:) * inputNeurons(:,1)))); 
  end
  hiddenNeurons = [hiddenNeurons; 1];
   
  for j = 1:2
    neuralNetworkOutput(j,:) = 1/(1+exp(-1*(outputWeights(j,:) * hiddenNeurons(:,1))));
  end
  
end