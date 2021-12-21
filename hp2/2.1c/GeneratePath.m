function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)

  numberOfNodes = size(visibility,1 );
  nodes = [1:numberOfNodes];
  updateNodes = nodes;
  node = randi([1 numberOfNodes]);
  tabuList = zeros(1, numberOfNodes);
  tabuList(1) = nodes(node);
  updateNodes(node) = [];
  nextNode = 0;
  prob = [];
  probNumerator = 0;
  probDenominator = 0;
  
  for i = 1:numberOfNodes-1
    updateNodesSize = size(updateNodes,2);
    for j = 1:updateNodesSize
      probNumerator = (pheromoneLevel(nodes(node), updateNodes(j)))^alpha*...
        ((visibility(nodes(node), updateNodes(j)))^beta);
      for k = 1:updateNodesSize
        probDenominator = probDenominator + ((pheromoneLevel(nodes(node),...
        updateNodes(k))^alpha)*(visibility(nodes(node), updateNodes(k))^beta));
      end
      probability = probNumerator/probDenominator;
      probDenominator = 0;
      
      prob=[prob probability];
    end
    node = GetNode(updateNodes, prob);
    tabuList(i+1) = updateNodes(node);
    nodes = updateNodes;
    updateNodes(node) = [];
    prob = [];
  end
  path = [tabuList tabuList(1)];
  
end
