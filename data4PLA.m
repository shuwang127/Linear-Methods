function [ data, label ] = data4PLA()
% generate the data for perceptron learning algorithm.
% Output : data - the input data (2*num, dim)
%          label - the output lable (2*num, [-1,+1])
% Shu Wang

%% Set parameters.
num = 100; % for each class
dim = 2;   % for dimension
initP = [0, 0]; % positive init sample with dim dimension.
initN = [5, 3]; % negative init sample with dim dimension.
para = 0.8; % parameter for randomness.

%% Generate positive samples.
dataP = zeros( num, dim );
labelP = ones( num, 1 );
for i = 1 : num
    dataP(i, :) = initP + para * randn(1, 2);
end

%% Generate negative samples.
dataN = zeros( num, dim );
labelN = -1 * ones( num, 1 );
for i = 1 : num
    dataN(i, :) = initN + para * randn(1, 2);
end

%% Generate the data and label.
data = [dataP; dataN];
label = [labelP; labelN];

%% Visualization.
figure(); hold on;
for i = 1 : 2*num
    if (label(i) == 1)
        plot(data(i,1), data(i,2), 'ro');
    elseif (label(i) == -1)
        plot(data(i,1), data(i,2), 'bx');
    end
end

end

