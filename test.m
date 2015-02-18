% load sparse data
% training features
X = spconvert(load('rcv1.train.features'));
% training labels
Y = load('rcv1.train.labels');

% test features
F = spconvert(load('rcv1.test.features'));
% test labels
L = load('rcv1.test.labels');

% training orders
O = load('training.orders');

[w, b] = perceptron(X, Y);

b
