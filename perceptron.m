err_train = zeros(10, 193);
err_test = zeros(10, 193);

for (ordering = 1 : 10)
    w = zeros(1, size(X,2)); b = 0; k = 0; eta = 1;
    % R = max(sum(X.^2, 2));    % R^2 value
    R = 1;  %R^2 = 1, so this is hard-coded to save time
    
    u = 1;  % interval counter
    u_e = 1;
    idx = 1;
    
    while (u_e < size(O, 2)) % less than number of articles
        disp(datestr(now, 'HH:MM:SS'))
        disp(ordering)
        disp(idx)   % DEBUG: print ordering and index
    %     for i = 1 : size(X, 1)	% go over articles
        u_e = u + 99;
        if (u_e > size(O, 2))
            u_e = size(O, 2);
        end

        for (i = u : u_e)
            if ((Y(O(ordering, i)) * (dot(w, X(O(ordering, i), :)) + b)) <= 0)    % incorrectly classified
                w = w + eta * Y(O(ordering, i)) * X(O(ordering, i), :);   % add point to weight vector
                b = b + eta * Y(O(ordering, i)) * R;   % update bias
                k = k + 1;
            end
        end

        % train error rate
        mis_train = 0;
        for (i = 1 : size(X, 1))
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
        err_train(ordering, idx) = (mis_train / size(X, 1) * 100);
        err_test(ordering, idx) = (mis_test / size(F, 1) * 100);
        idx = idx + 1;
    end
    
end
