function [generation] = regionalGeneration(numberHomes, variancePlants, hourlyGen) 
% Delegates electricity generating abilities amongst the solar generating
% power plants in the region. This function gets the generation for each
% plant to contain 1 panel and also implements the ground-level randomness
% between power plants. 

% 3D matrix to contain hourly generation abilities for each of the plants. 
% Note: Each z-axis column is a power plant. 
%       Each xy plane is an hour in the year. (8760 hours in a year). 
generation = zeros(sqrt(numberHomes), sqrt(numberHomes), 8760);  

% Set the generation for each power plant 
for i = 1:sqrt(numberHomes)
    for j = 1:sqrt(numberHomes)
        % Obtain +- variance percentage for each plants generation 
        electricityVariance = (1 - variancePlants) + (variancePlants + variancePlants).*rand(8760,1);
        % Obtain the generation for the plant. (This function sets each
        % plant with a single unit. Number of panels will be set later. 
        generation(i, j, :) = (hourlyGen.*electricityVariance); 
    end 
end 