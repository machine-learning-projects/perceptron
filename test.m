% load sparse data
% training features
X = spconvert(load('rcv1.train.features'));
% training labels
Y = load('rcv1.train.labels');

% test features
F = spconvert(load('rcv1.test.features'));
F = padarray(F, [0 (size(X, 2) - size(F, 2))], 0, 'post');
% test labels
L = load('rcv1.test.labels');

% training orders
O = load('training.orders');

% [w, b] = perceptron(X, Y, F, L);
perceptron(X, Y, F, L);

% b
