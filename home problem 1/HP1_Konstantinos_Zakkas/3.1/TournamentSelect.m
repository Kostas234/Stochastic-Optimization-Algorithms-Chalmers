function iSelected = TournamentSelect(fitness, pTournament, tournamentSize)

  populationSize = size(fitness,1);
  iTmp = zeros(tournamentSize,1);
  
  for i = 1:tournamentSize
    iTmp(i) = 1 + fix(rand*populationSize);
  end

  for l = 1:size(iTmp,1)
    if size(iTmp,1)==1
      iSelected = iTmp(1);
      break;
    end
    r = rand;
    iTmpBest = iTmp(1);
    iTmpBestIndex = 1;
    for j = 1:size(iTmp,1)-1
      if (fitness(iTmp(j+1)) > fitness(iTmpBest)) 
        iTmpBest = iTmp(j+1);
        iTmpBestIndex = j+1;
      end
    end
  
    if (r < pTournament)
      iSelected = iTmpBest;
      break
    else
      iTmp(iTmpBestIndex,:)= [];
    end
  end

end