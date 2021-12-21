function pathLength = GetPathLength(path, cityLocation)

  pathLength = 0;
  pathSize = size(path,2);
  for i = 1:pathSize-1
    pathLength = pathLength + pdist([cityLocation(path(i),1), cityLocation(path(i),2);...
      cityLocation(path(i+1),1),cityLocation(path(i+1),2)],'euclidean');
  end
    
end