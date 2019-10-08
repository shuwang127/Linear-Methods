%% Linear Regression (LR)
% Shu Wang

%% clear
clear;
close all;

%% generate the data
[ data, label ] = data4LR();

%% data preparation
num = size(data, 1);
dim = size(data, 2);
data = [ data, ones(num, 1) ]; % extend data with x_0 = 1

%% Calculate w
w = (data' * data) \ data' * label;

%% Calculate in-sample error
Ein = sum((data * w - label) .^ 2) / num;
disp(['Ein = ', num2str(Ein)]);

%% Visualization.
xmin = -5;
xmax = 5;
ymin = [xmin, 1] * w;
ymax = [xmax, 1] * w;
hnd1 = plot([-5, 5], [10, 3], 'g', 'Linewidth', 2);
hnd2 = plot([xmin, xmax], [ymin, ymax], 'b', 'Linewidth', 1);
legend([hnd1, hnd2], {'Ground Truth', 'Estimation'});
