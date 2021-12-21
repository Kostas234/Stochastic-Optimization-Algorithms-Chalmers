function velocity = UpdateVelocity(prevVelocity, prevPosition,...
  bestParticlePosition, bestSwarmPosition, inertiaWeight, range)
  
  rangeSize = size(range,2);
  velocityMax = range(rangeSize) - range(1);
  velocity = inertiaWeight*prevVelocity +2*rand*(bestParticlePosition-prevPosition)+...
    2*rand*(bestSwarmPosition-prevPosition);
  
  if velocity>velocityMax
    velocity = velocityMax;
  elseif velocity<-velocityMax
    velocity = -velocityMax;
  end
  
end