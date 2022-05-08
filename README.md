Note for professor: This paragraph is copied from my report. 

This program models a set of independent solar power producers transferring their electricity into a grid through substations. The substations prioritize transferring the least amount of electricity during each timestep as large transfers from high to low electric potential are costly to the substations. Power producers that send first are rewarded by receiving more solar panels; those late to send, find a portion of their solar panels taken away. 

To run the program, go to the main.m file and run the program. 

To change graph visualizations, go to the run.m file and select the plot variables to be true or false. 

To select a specific location from which the simulation will initially collect data, go to https://pvwatts.nrel.gov/pvwatts.php, select your location, choose addition parameters, and on the final page, scroll to Download Results, and select hourly. Place this file into the same for which the main.m file is located. Then, open the retrieveVariables function, and for the hourlyGen variable, inside the quotation marks, place this csv's filename. 

To change parameters such as levels of randomness, range in the possible number of panels per plant, or the number of power plants in total, go to the retrieveVariable function. 
