function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)

  pathSize = size(pathCollection);
  delta = zeros(pathSize(1),pathSize(2)-1);
  
  for i = 1:pathSize(1)
    for j = 1:pathSize(2)-1
      delta(pathCollection(i,j), pathCollection(i, j+1)) = ...
        delta(pathCollection(i,j), pathCollection(i, j+1)) + ...
        1/pathLengthCollection(i);
    end
  end
  deltaPheromoneLevel = delta;
  
end