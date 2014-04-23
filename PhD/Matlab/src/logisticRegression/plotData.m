function plotData(X, y)
%	PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% Find indecies of Positive and Negative examples
pos = find(y == 1);
neg = find(y == 0);
% Plot examples
plot(X(pos, 1), X(pos, 2), 'r+', ...
	'LineWidth', 3, 'MarkerSize', 10);
plot(X(neg, 1), X(neg, 2), 'yo', ...
	'LineWidth', 3, 'MarkerSize', 10);

% Labels and Legend
xlabel('Exam 1 score', 'fontsize', 20);
ylabel('Exam 2 score', 'fontsize', 20);

% Specified in plot order
legend('Admitted', 'Not admitted');
hold off;

end
