function visibility = GetVisibility(cityLocation)

  numOfCities = size(cityLocation,1);
  visibility = zeros(numOfCities, numOfCities);
  
  for i = 1:numOfCities
    for j = 1:numOfCities
      if i == j
        continue % so there is no division with zero
      end
      distance = pdist([cityLocation(i, 1), cityLocation(i, 2);...
      cityLocation(j, 1), cityLocation(j, 2)],'euclidean');
      visibility(i, j) = 1/distance;
    end
  end
  
end