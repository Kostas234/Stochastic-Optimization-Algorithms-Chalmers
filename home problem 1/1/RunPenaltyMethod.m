mu = [1 10 100 1000];
startingPoint = [1 2];
threshold = 10^-6;
stepLength = 0.0001;
minimum = zeros(size(mu,2),2);

for i =1:size(mu,2)
  minimum(i,:) = RunGradientDescent(startingPoint, mu(i), stepLength, threshold);
end

tableHeaders = {'mu', 'x1', 'x2'};
result = table(transpose(mu(1,:)),minimum(:,1),minimum(:,2), 'VariableNames', tableHeaders);
disp(result);