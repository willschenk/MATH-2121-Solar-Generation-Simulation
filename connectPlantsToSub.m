function [subToPlant] = connectPlantsToSub(plantIndexGrid, subIndexGrid, gen, unitGrid)
% Each hour, the power plants send their electricity to a substation in
% order from least to greatest. 
% Each of the four immediate power plants surounding each substation will
% send their electricty from smallest to largest load. 
% This function sets and returns this order. 

% Total number of power plants in this regional grid. 
length = size(plantIndexGrid, 1); 


% Cell matrix array containing the four immediate neighbors of each
% substation.  

% Note: These are the four closest plants that can send
% electricity but there are four more, that while being closer to another
% substaion, can still send to this substation.
subToPlant = cell(size(subIndexGrid, 1), size(subIndexGrid, 1)); 

% Actual energy generation of each power plant for this particular hour with number of
% solar panels considered. 
gen = gen .* unitGrid; 

% Go to each substation, left to right, top to bottom, and set the order of
% power plants to their loads in order from smallest to largest. 
for i = 1:size(plantIndexGrid,1) 
    for j = 1:size(plantIndexGrid, 1) 
        if (i < length && j < length) 
            % Obtain the generation four immediately neighboring plants. 
            A = [gen(i, j), gen(i, j + 1), gen(i + 1, j), gen(i + 1, j + 1)]; 
            % Obtain the indexes for each of these plants. 
            B = [plantIndexGrid(i, j), plantIndexGrid(i, j + 1), plantIndexGrid(i + 1, j), plantIndexGrid(i + 1, j + 1)]; 
            % Sort these four plants based on their size.  
            [~, sortIndex] = sort(A); 
            % Obtain the ordered array of plants based on size. 
            B = B(sortIndex); 
            % Place each ordered array into the cell matrix that will be
            % returned. 
            subToPlant{i, j} = B; 
        end 
    end 
end  
end