function [S] = im2segment(im)

[m, n] = size(im); % Size of image
M1 = zeros(m,n); % Create matrix of zeros as big as image
M1 = im >= 24; % Insert ones in matrix where image pixel intensity reaches threshold of 24

M2 = bwlabel(M1, 8); % Segmentize ones 

M2 = smooth(M2, m, n); % Smoothing with my own function 
                        %(removes ones with less than 2 neighbours and adds
                        % ones where zeros have 4 'one'-neighbours
%M2 = bwlabel(M2, 8); % Segmentize again 

nrofsegments = max(M2(:)); % Calculate number of segments

digits = 0; % Number of real digits

for i = 1:nrofsegments % Iterate through segments
        [rows, cols] = find(M2 == i); % Get coordinates for segment
            if length(rows) > 40 % Only let through segments with over 40 ones
                segment = zeros(m, n); % Blank image
                for j = 1:size(rows) 
                    segment(rows(j), cols(j)) = 1; % Set corresponding coordinate to 1 in segment
                end
                digits = digits + 1;
                S{digits} = segment; % Add to S
            end
end

end
