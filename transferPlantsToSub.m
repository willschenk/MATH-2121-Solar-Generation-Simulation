function [hourGeneration, hourSub, plantsAccessedOrder] = transferPlantsToSub(gen, varianceHourly, plantIndexGrid, subIndexGrid, subToPlantOptions, unitGrid) 
% Send the electricity from the plants to the substations. The
% plants sourounding each substation have already been placed into order. 
% Now establish the order by which the substaions pull electricity from the
% plants, do so, and record the amounts of electricity that each substation
% obtains. 

% The variance between plants on an hourly basis. (Cloudcover, ect.) 
hourlyByPlantVariance = (1 - varianceHourly) + (varianceHourly + varianceHourly).*rand(size(plantIndexGrid,1));
% Set blank cell array: Order of plants sending their electricity 
plantsAccessedOrder = cell(1); 
% Blank matrix to record substations electricity collection 
hourSub = zeros(size(subIndexGrid, 1)); 
% Amount of electricity each power plant generates in an hour. 
hourGeneration = unitGrid .* gen .* hourlyByPlantVariance; 
% Order by which substations pull their electricity from all neighboring
% plants. 
subOrder = selectBestSub(subToPlantOptions, hourGeneration, plantIndexGrid, subIndexGrid);
for i = 1:size(subOrder, 2) % For each substation
    [x, y] = find(subIndexGrid == subOrder(i)); % Obtain the position where the substation is 
    for z = 1:size(subToPlantOptions{x, y},2) % Loop through each of the connected plants 
        % Only pull from plants that have not been pulled from yet 
        if ~ismember(subToPlantOptions{x,y}(z), cell2mat(plantsAccessedOrder{1,1})) 
            % Record the accessed power plant 
            plantsAccessedOrder{1,1}{end+1} = subToPlantOptions{x,y}(z); 
            % Find the position of this plant on the grid 
            [a, b] = find(plantIndexGrid == subToPlantOptions{x, y}(z)); 
            % Add in the amount of generation this plant pushes to the
            % substation 
            hourSub(x, y) = hourSub(x, y) + hourGeneration(a, b);
        end
    end
end
end