function [subOrderList] = selectBestSub(subToPlantOptions, gen, plantIndexGrid, subIndexGrid) 
% Set the order for which the substations will pull electricity from all of
% the power plants which they are connected to. 
% The substations with the least energy summed from the four sourounding sources will be
% selected first and selections will continue in ascending order. 

% Blank matrix to record hypothetical amount of electricity that can be
% transfered to a substaiton. 
optionSubTotals = zeros(size(subIndexGrid, 1)); 
for m = 1:size(subIndexGrid, 1) 
    for n = 1:size(subIndexGrid, 1) 
        % For each plant that is connected to the respective substation 
        for p = 1:size(subToPlantOptions{m,n}, 2) 
            % Record the position of the plant on the grid 
            [x, y] = find(subToPlantOptions{m,n}(p) == plantIndexGrid); 
            % Add in the possible generation from this respective plant 
            optionSubTotals(m,n) = optionSubTotals(m,n) + gen(x, y); 
        end 
    end 
end 

% You now have a list of optionSubTotals. It contains the amount of
% combined energy each substation can potentially grab. 

% Place the indices into a list from smallest to largest 
subOrderList = zeros(1, size(subIndexGrid, 1)^2); 
for l = 1:size(subOrderList, 2) 
    % Find the least amount of electricity that a substation can pull. 
    m = min(min(optionSubTotals)); 
    % Find the position of this substation 
    [a, b] = find(optionSubTotals == m); 
    % Set this substation to zero to prevent it from being selected again 
    optionSubTotals(a, b) = NaN; 
    % Place the substation index into the ordered list 
    subOrderList(l) = subIndexGrid(a, b); 
end 


end