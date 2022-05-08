function [theGrid] = establishIndexGrid(count)
% Take in the total number of elements needed for the 2d matrix, create
% that matrix and assign each value an ordered positive integer value: 1 to count  

% Create the matrix 
theGrid = zeros(sqrt(count)); 
% Assign the positive ordered integers to the matrix 
theGrid(:) = 1:(count); 
% Transpose the matrix to read the numbers left to right, top to bottom. 
theGrid = theGrid.'; 

end