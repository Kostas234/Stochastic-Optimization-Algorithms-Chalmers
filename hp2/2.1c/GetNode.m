function node = GetNode(nodes, probabilities)

  node = 0;
  r = rand;
  probabilitiesSize = size(probabilities,2);
  cumulativeSum = zeros(1,probabilitiesSize);
  cumulativeSum(1) = probabilities(1);
  
  for i = 1:probabilitiesSize-1
    cumulativeSum(i+1) = cumulativeSum(i) + probabilities(i+1);
  end
  cumulativeSumSize = size(cumulativeSum,2);
  for j = 1:cumulativeSumSize
    if r<cumulativeSum(j)
      node = j;
      break;
    end
  end

end