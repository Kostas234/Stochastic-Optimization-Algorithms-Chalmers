function [distances, speeds] = truckModel(individual, iDataSet, iSlope)

  % Constants
  truckMass = 20000;
  gravity = 9.806;
  ambientTemp = 283;
  brakeTempMax = 750;
  speedMax = 25;
  speedMin = 1;
  slopeAngleMax = 10;
  tau = 30;
  cH = 40;
  cB = 3000;
  slopeLength = 1000;
  timeStep = 0.2; % <0.25
  numberOfGears = 10;
  gearChangeLimit = 2; % every 2 seconds
  engineBrakeForce = [7*cB 5*cB 4*cB 3*cB 2.5*cB 2*cB 1.6*cB 1.4*cB 1.2*cB cB];

  % At start position %
  distance = 0;
  speed = 20;
  gear = 7;
  brakeTemp = 500;
  deltaBrakeTemp = brakeTemp - ambientTemp;
  pedalPressure = 0;
  time = 0;
  prevGearChangeTime = -1;
  iIteration = 1;
  times = [];
  distances = [];
  speeds = [];
  gears = [];
  pedalPressures = [];
  brakeTemps = [];

  while distance<slopeLength
      
    slopeAngle = GetSlopeAngle(distance, iSlope, iDataSet);
    gravityForce = truckMass*gravity*sind(slopeAngle);
  
    % Foundation Brake Force
    if brakeTemp<brakeTempMax-100
      foundationBrakeForce = (truckMass*gravity/20)*pedalPressure;
    else
      foundationBrakeForce = (truckMass*gravity/20)*pedalPressure*...
        exp(-(brakeTemp-(brakeTempMax-100))/100);
    end
  
    acceleration = (gravityForce - foundationBrakeForce - engineBrakeForce(gear))/...
      truckMass;

    times = [times time];
    speeds = [speed speed];
    distances = [distances distance];
    gears = [gears gear];
    pedalPressures = [pedalPressures pedalPressure];
    brakeTemps = [brakeTemps brakeTemp];
  
    % Run FFNN and get output
    speedInput = speed/speedMax;
    slopeInput = slopeAngle/slopeAngleMax;
    tempInput = brakeTemp/brakeTempMax;
    neuralNetwork = RunTruckModel(speedInput, slopeInput, tempInput, individual);
    pedalPressure = neuralNetwork(1);
    deltaGear = neuralNetwork(2);
  
    % Update state
    distance = distance + speed*timeStep*cosd(slopeAngle);
    speed = speed +acceleration*timeStep;
    if pedalPressure<0.01
      diffDeltaBrakeTemp = -deltaBrakeTemp/tau;
    else
      diffDeltaBrakeTemp = cH*pedalPressure;
    end
  
    deltaBrakeTemp = deltaBrakeTemp + diffDeltaBrakeTemp*timeStep;
    brakeTemp = ambientTemp + deltaBrakeTemp;
  
    if deltaGear<=0.3 
      if time-prevGearChangeTime >= gearChangeLimit
        gear = gear - 1;
        if gear -1 < 1
          gear = 1;
        end
        prevGearChangeTime = time;
      end
    elseif deltaGear >=0.7
      if time-prevGearChangeTime >= gearChangeLimit
        gear = gear + 1;
        if gear + 1 >=numberOfGears
          gear = numberOfGears;
        end
        prevGearChangeTime = time;
      end
    end
  
    if speed>speedMax || speed<speedMin || brakeTemp>brakeTempMax
      break;
    end
  
    iIteration = iIteration + 1;
    time = time + timeStep;

  end

  times = [times time];
  speeds = [speed speed];
  distances = [distances distance];
  gears = [gears gear];
  pedalPressures = [pedalPressures pedalPressure];
  brakeTemps = [brakeTemps brakeTemp];
  
end