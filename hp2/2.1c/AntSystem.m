clear all;
clc;

cityLocation = LoadCityLocations();
numberOfCities = length(cityLocation);
numberOfAnts = numberOfCities;
alpha = 1.0;
beta = 3.0;
rho = 0.15;

nearestNeighbourPathLength = GetNearestNeighbourPathLength(cityLocation);
tau0 = numberOfAnts/nearestNeighbourPathLength;
targetPathLength = 128;

range = [0 20 0 20];
tspFigure = InitializeTspPlot(cityLocation, range);
connection = InitializeConnections(cityLocation);
pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0);
visibility = GetVisibility(cityLocation);
minimumPathLength = inf;

iIteration = 0;

while (minimumPathLength > targetPathLength)
 iIteration = iIteration + 1;
 pathCollection = [];
 pathLengthCollection = [];
 
 for k = 1:numberOfAnts
  path = GeneratePath(pheromoneLevel, visibility, alpha, beta);
  pathLength = GetPathLength(path, cityLocation);
  if (pathLength < minimumPathLength)
    bestPath = path;
    minimumPathLength = pathLength;
    disp(sprintf('Iteration %d, ant %d: path length = %.5f',iIteration,k,minimumPathLength));
    PlotPath(connection,cityLocation,path);
  end
  pathCollection = [pathCollection; path];
  pathLengthCollection = [pathLengthCollection; pathLength];
 end

 deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection);
 pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho);
 
end
disp('Best Path: ');
disp(bestPath);