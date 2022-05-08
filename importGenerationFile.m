function [dataVector] = importGenerationFile(filename, dataLines) 
%% Function to obtain generation data for a specific location: 
% Import the local file containing the hourly ability to generate
% electricity in a region. This function is designed to interpret the csv
% file obtained from going to the site,
% https://pvwatts.nrel.gov/pvwatts.php, typing in a location, specifying
% the parameters and downloading the hourly generation file. 

% Source: Mathworks MATLAB Import File Function

%% Input handling
% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [19, 8778];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 11, "Encoding", "UTF-8");

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Month", "Day", "Hour", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "DCArrayOutputW", "ACSystemOutputW"];
opts.SelectedVariableNames = ["DCArrayOutputW"]; 
opts.VariableTypes = ["double", "double", "double", "string", "string", "string", "string", "string", "string", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var4", "Var5", "Var6", "Var7", "Var8", "Var9"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var4", "Var5", "Var6", "Var7", "Var8", "Var9"], "EmptyFieldRule", "auto");

% Import the data into a matrix array. 
dataVector = table2array(readtable(filename, opts));  
end