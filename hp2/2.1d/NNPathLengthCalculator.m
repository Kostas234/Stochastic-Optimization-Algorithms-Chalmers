pathLength = 0.0;
cityLocations = LoadCityLocations;
updateCityLocations = cityLocations;
numOfCities = size(cityLocations, 1);
numOfNode = randi([1 numOfCities]);
nodeLocation = cityLocations(numOfNode,:);
updateCityLocations(numOfNode,:) = [];
numOfCities = numOfCities - 1;
shortestPath = 10^5;
shortestPathIndex = 0.0;
  
for i = 1:numOfCities%-1
  updateCityLocationsSize = size(updateCityLocations,1);
  for j = 1:updateCityLocationsSize
    neighbourPath = pdist([nodeLocation(1), nodeLocation(2);...
    updateCityLocations(j,1),updateCityLocations(j,2)],'euclidean');
    if shortestPath > neighbourPath
      shortestPath = neighbourPath;
      shortestPathIndex = j;
    end
  end
  pathLength = pathLength + shortestPath;
  
  shortestPath = 10^5;
  nodeLocation = updateCityLocations(shortestPathIndex,:);
  if size(updateCityLocations,1) == 1
    pathLength = pathLength +...
      pdist([updateCityLocations(shortestPathIndex,1),...
      updateCityLocations(shortestPathIndex,2);...
      cityLocations(numOfNode,1),cityLocations(numOfNode,2)]);
    break
  else
    updateCityLocations(shortestPathIndex,:) = [];
  end
end
disp(pathLength);
