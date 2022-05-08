function main 
%% Simulation Overview: 
% This program takes simulates the scenario of a grid of solar power plants
% each of which each plant generates different amounts of electricity every
% hour transfers that electricity to a substation, for which it is then
% transferred to the electricity grid. 
% To minimize the amount of electrical surge transfering into each
% substation, the substations choose the plants they pull from, from
% smallest to largest. 
% The substations that are projected to pull the least amount of
% electricity from their closest four neighboring plants pull their
% electricity from all of their nieghboring plants first. 
% The plants that push the least amount of electricity grow in size while
% those that push the most amount of electricty shrink in size. 
%% Will Schenk 4/16/2022 

%% Starting Variables 
% Place all initial state variables in the retrieveVariables function. 
[numberPlants, variancePlants, varianceHourly, hourlyGen, lowerBoundUnits, upperBoundUnits] = retrieveVariables(); 

%% Retreive Generation 
% Matrix of every plants hourly generating abilities for the entire year. 
generation = regionalGeneration(numberPlants, variancePlants, hourlyGen); 

%% Index Grids 
% Assign a number to each plant in the grid of solar plants. 
plantIndexGrid = establishIndexGrid(numberPlants); 
% Assign a number to each substation in the grid of substations. Note: Pass
% 1/4 the number of plants so there is 4 plants for every substation. 
subIndexGrid = establishIndexGrid((sqrt(numberPlants) - 1)^2); 

%% Unit Grid 
% Matrix containing distribution of number of panels per power plant. 
unitGrid = randi([lowerBoundUnits, upperBoundUnits], sqrt(numberPlants), sqrt(numberPlants)); 

% Run the simulation using the inputs prescribed above. 
run(generation, plantIndexGrid, subIndexGrid, unitGrid, varianceHourly); 



