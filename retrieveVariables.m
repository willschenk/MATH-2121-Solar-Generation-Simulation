function [numberPlants, variancePlants, varianceHourly, hourlyGen, lowerBoundUnits, upperBoundUnits] = retrieveVariables() 
%% Set the initial state variables of the program that will be sent back to main. 
    numberPlants = 100; % Number of solar power plants. Make this number a perfect square.  
    variancePlants = .1; % Percentage of randomness of solar generating plant (Age of plant, and other ground level factors) 
    varianceHourly = .1; % Percentage of randomness of hourly solar generation (Cloudcover, temperature, ect) 
    hourlyGen = importGenerationFile("North Philadelphia East.csv"); % File of location's hourly generation. 
    lowerBoundUnits = 10; % Minimum number of units/panels a plant could start with 
    upperBoundUnits = 100000; % Maximum number of units/panels a plant could start with 
end 
