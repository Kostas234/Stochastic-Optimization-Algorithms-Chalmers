clear all;

populationSize = 30;
numberOfVariables = 2;
range = -5:5;
positions = InitializePopulation(populationSize, numberOfVariables, range);
velocity = InitializeVelocity(populationSize, numberOfVariables, range);
functionValue = zeros(populationSize,1);
bestParticlePosition = zeros(populationSize,2);
bestSwarmPosition = zeros(1, 2);
bestParticleValue = zeros(populationSize,1) + 10^5;
bestSwarmValue = 10^5;
inertiaWeight = 1.4;
beta = 0.99;

for iterations  = 1:300
    
  for i = 1:populationSize

    functionValue(i) = EvaluateIndividual(positions(i,:));
    if functionValue(i)<bestParticleValue(i)
      bestParticleValue(i) = functionValue(i);
      bestParticlePosition(i,:) = positions(i,:);
    end
  
    if functionValue(i)<bestSwarmValue
      bestSwarmValue = functionValue(i);
      bestSwarmPosition = positions(i, :);
    end
    
  end
  
  tempVelocity = velocity;
  tempPositions = positions;
  for l = 1:populationSize
    tempVelocity(l, :) = UpdateVelocity(velocity(l,:), positions(l,:), ...
      bestParticlePosition(l,:), bestSwarmPosition, inertiaWeight, range);
    tempPositions(l,:) = UpdatePositions(positions(l,:), tempVelocity(l,:));  
  end
  
  velocity = tempVelocity;
  positions = tempPositions;
  
  if inertiaWeight>0.3
    inertiaWeight = inertiaWeight*beta;
  end
    
end
fprintf('Minimum in location: %.6f, %.6f\n',bestSwarmPosition);
fprintf('Function value for minimum: %d\n', bestSwarmValue);
