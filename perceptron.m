function [w, b] = perceptron(X, Y)

w = zeros(1, size(X,2)); b = 0; k = 0; eta = 1;


% R = max(sum(X.^2, 2));    % R^2 value

R = 1;  %R^2 = 1, so this is hard-coded to save time

u = 1;  % interval counter

while u < 19200 % less than number of features
%     for i = 1 : size(X, 1)	% go over articles
    for i = u : u + 99
        if (Y(i) * (dot(w, X(i, :)) + b)) <= 0    % wrong?
            w = w + eta * Y(i) * X(i, :);   % add point to weight vector
            b = b + eta * Y(i) * R;   % update bias
            k = k + 1;
        end
    end
    
    u = u + 100; % increment for next set of 100
    
    k   % total number of errors
    
end

end
