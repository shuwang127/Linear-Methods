%% Perceptron Learning Algorithm (PLA)
% Shu Wang

%% clear
clear;
close all;

%% generate the data
[ data, label ] = data4PLA();

%% data preparation
num = size(data, 1);
dim = size(data, 2);
data = [ data, ones(num, 1) ]; % extend data with x_0 = 1
w = zeros(1, dim + 1); % init the weight vector

%% PLA algorithm.
cnt = 0;
while (cnt < 1000)
    h = sign( data * w' ); % get predictions.
    index = find(h ~= label); % get index for prediction ~= label.
    if isempty(index) % if no sample misclassified
        break;
    end
    idx = index(randperm(numel(index),1)); % select one sample.
    w = w + label(idx) * data(idx, :); % update the weight.
    cnt = cnt + 1;
end

%% Visualization.
x1min = 0;
x1max = 5;
x2min = - (w(1) * x1min + w(end)) / w(2);
x2max = - (w(1) * x1max + w(end)) / w(2);
plot([x1min, x1max], [x2min, x2max]);
