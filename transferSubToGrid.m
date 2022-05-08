function [energyToGrid] = transferSubToGrid(hourSub) 
% Properly move electricity from the substations to the grid here. 
energyToGrid = 0; 
for i = 1:size(hourSub, 2)
    for j = 1:size(hourSub, 2)
        energyToGrid = energyToGrid + hourSub(i, j);
    end
end
end