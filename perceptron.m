% function [w, b] = perceptron(X, Y, F, L)
function [err] = perceptron(X, Y, F, L)

w = zeros(1, size(X,2)); b = 0; k = 0; eta = 1;

% R = max(sum(X.^2, 2));    % R^2 value
R = 1;  %R^2 = 1, so this is hard-coded to save time

err = [];

u = 1;  % interval counter
u_e = 1;

while u_e < size(X, 1) % less than number of features
%     for i = 1 : size(X, 1)	% go over articles
    u_e = u + 99;
    if (u_e > size(X, 1))
        u_e = size(X, 1);
    end
    
    for i = u : u_e
        if (Y(i) * (dot(w, X(i, :)) + b)) <= 0    % wrong?
            w = w + eta * Y(i) * X(i, :);   % add point to weight vector
            b = b + eta * Y(i) * R;   % update bias
            k = k + 1;
        end
    end
    
    u = u + 100; % increment for next set of 100
    
%     k   % total number of mistakes
    
    incorrect = 0;  % number of incorrectly classified tests
    
    for i = 1 : size(F, 1)  % go over the test articles
        if sign(dot(w, F(i, :)) + b) ~= L(i)    % incorrectly classified
            incorrect = incorrect + 1;
        end
    end
    
    err(end + 1) = incorrect / u * 100;
    
end

err

end
