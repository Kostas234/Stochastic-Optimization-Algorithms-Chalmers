function fitness = EvaluateIndividual(chromosome)
  
  cityLocations = LoadCityLocations;
  individualSize = size(chromosome,2);
  distance = 0;
  
  for i = 1:individualSize-1
    distance = distance + pdist([cityLocations(chromosome(i),1),cityLocations(chromosome(i),2);...
      cityLocations(chromosome(i+1),1),cityLocations(chromosome(i+1),2)],'euclidean');
  end
  distance = distance + pdist([cityLocations(chromosome(1),1),cityLocations(chromosome(1),2);...
    cityLocations(chromosome(individualSize),1),cityLocations(chromosome(individualSize),2)],...
    'euclidean');
  fitness = 1/distance;

end