function [w, b, err_train, err_test] = perceptron(X, Y, F, L)

w = zeros(1, size(X,2)); b = 0; k = 0; eta = 1;
% R = max(sum(X.^2, 2));    % R^2 value
R = 1;  %R^2 = 1, so this is hard-coded to save time
err_train = zeros(193, 2);
err_test = [2, 193];
u = 1;  % interval counter
u_e = 1;
idx = 1;
while (u_e < size(X, 1)) % less than number of features
%     for i = 1 : size(X, 1)	% go over articles
    u_e = u + 99;
    if (u_e > size(X, 1))
        u_e = size(X, 1);
    end
    
    for (i = u : u_e)
        if ((Y(i) * (dot(w, X(i, :)) + b)) <= 0)    % incorrectly classified
            w = w + eta * Y(i) * X(i, :);   % add point to weight vector
            b = b + eta * Y(i) * R;   % update bias
            k = k + 1;
        end
    end
    
    % train error rate
    mis_train = 0;
    for (i = u : u_e)
        if (sign(dot(w, X(i, :)) + b) ~= Y(i))  % incorrectly classified
            mis_train = mis_train + 1;
        end
    end
        
    % test error rate
    mis_test = 0;  % number of incorrectly classified tests    
    for (i = 1 : size(F, 1))  % go over the test articles
        if (sign(dot(w, F(i, :)) + b) ~= L(i))    % incorrectly classified
            mis_test = mis_test + 1;
        end
    end
    
    % keep track of error rates
    u = u + 100; % increment for next set of 100
    err_train(idx, 1) = idx;
    err_train(idx, 2) = (mis_train / u * 100);
    err_test(idx, 1) = idx;
    err_test(idx, 2) = (mis_test / size(F, 1) * 100);
    idx = idx + 1;
end

end
