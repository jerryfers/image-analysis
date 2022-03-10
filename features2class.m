function y = features2class(x, classification_data)

y = 0;
E = 10000000; % A very high value
M1 = cell2mat(classification_data(1, 1)); % Convert cells to matrices
M2 = cell2mat(classification_data(1, 2));
[m, n] = size(M1);

% Loop through feature vectors
for i = 1: n 
    % Calculate difference between feature vector x and feature vector from training data
    D = norm(x - M1(:,i));
    % If the stored value is higher than the current difference (D)
    if D < E
        % The best approx of y is stored
        y = M2(:, i);
        % Save current difference
        E = D;
    end
end

end

