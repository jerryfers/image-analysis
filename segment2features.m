function features = segment2features(B)
m = 12;
n = 11;

% creates the smallest possible matrix around one digit
[row, col] = find(B);
regimg = B(min(row):max(row), min(col):max(col)); 
regimg = imresize(regimg, [m, n]);

% create feature vector
features = zeros(m*n, 1);

% fill vector with pixel values
counter = 0;
for i = 1:m
    for j = 1:n
        counter = counter +1;
        features(counter, 1) = regimg(i, j);
    end
end

end