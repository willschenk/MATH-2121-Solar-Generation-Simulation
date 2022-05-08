function [unitGrid] = orderImpact(unitGrid, plantsAccessedOrder, plantIndexGrid)
% Plants that are accessed first receive a boost in the number of solar panels
% and plants that are accedded after the midpoint recieve a decrease in
% their number of panels. 


% Total number of power plants 
numPlants = size(unitGrid, 1)^2; 
% Order by which the plants are accessed 
plantsAccessedOrder = cell2mat(plantsAccessedOrder{1}); 
% Establish midpoint where plants go from positively impacted to
% negatively impacted. 
divider = round(numPlants/2); 
for m = 1:divider 
    % Find the position of the plant to be positively impacted 
    [a, b] = find(plantsAccessedOrder(m) == plantIndexGrid);
    % Increase the number of panels at this plant 
    unitGrid(a, b) = 1.20 * unitGrid(a, b);  
end 

for n = divider:numPlants
    % Find the position of the plant to be negatively impacted 
    [a, b] = find(plantsAccessedOrder(n) == plantIndexGrid); 
    % Decrease the number of panels at this plant 
    unitGrid(a, b) = 0.90 * unitGrid(a, b);  
end 
