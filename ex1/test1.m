data = load('testing.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples

% Plot Data
% Note: You have to complete the code in plotData.m
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 3: Cost and Gradient descent ===================

X = [ones(m, 1), data(:,1)] % Add a column of ones to x as the x0 parameter
theta = zeros(2, 1) % initialize fitting parameters
theta=[5;0]

% Some gradient descent settings
iterations = 500;
alpha = 0.03;

fprintf('\nTesting the cost function ...\n')
% compute and display initial cost
J = computeCost(X, y, theta)

m = length(y); 
for iter = 1:iterations
  %hypothesis vector - multiply X by theta
  h = X * theta;
  
  %errors vector
  err = h - y;
  %the change in theta
  theta_change = alpha*(1/m)*X'*err;
  %assigning new value
  theta = theta - theta_change
  %display cost to see the changes
  J = computeCost(X, y, theta)
end
