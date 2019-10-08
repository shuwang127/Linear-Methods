function [ data, label ] = data4LR()
% generate the data for linear regression.
% Output : data - the input data (num, dim)
%          label - the output lable (num, 1)
% Shu Wang

%% Set parameters.
num = 100; % for sample number
dim = 1;   % for dimension
initS = [-5, 10]; % init start sample.
initE = [5, 3];   % init end sample.
para = 0.9; % parameter for randomness.

%% Generate samples.
data = zeros( num, dim );
label = ones( num, 1 );
for i = 1 : num
    p = initS + rand() * (initE - initS); % get a point from the line
    p_r = p + para * randn(1, 2);
    data(i, 1) = p_r(1);
    label(i, 1) = p_r(2);
end

%% Visualization.
figure(); hold on;
for i = 1 : num
	plot(data(i,1), label(i,1), 'ro');
end
plot([initS(1), initE(1)], [initS(2), initE(2)], 'g', 'Linewidth', 2);

end

