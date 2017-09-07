Figure_11_Data_Readme.txt

Filename format: [Figure_11_Data.mat]

Data contents: The absolute difference and ratio of the 2.5/97.5 percentiles of temperature and load in the representative cities datasets compared to the NLDAS dataset by PROMOD zone and Class of data. The data format is the same in each season - we will use DJF as an example.

DJF_T - The absolute difference between the 2.5 percentiles of temperature in the Class A-F datasets compared to the NLDAS datasets by PROMOD zone [6 x 19].
  Columns 1-19: The absolute difference in each PROMOD zone (defined by the variable PZ in the same file)
  Row 1: The absolute difference between the Class A representative cities temperatures and NLDAS
      2: The absolute difference between the Class B representative cities temperatures and NLDAS
      3: The absolute difference between the Class C representative cities temperatures and NLDAS
      4: The absolute difference between the Class D representative cities temperatures and NLDAS
      5: The absolute difference between the Class E representative cities temperatures and NLDAS
      6: The absolute difference between the Class F representative cities temperatures and NLDAS

DJF_Load - The ratio between the 2.5 percentiles of load in the Class A-F datasets compared to the NLDAS datasets by PROMOD zone [6 x 19].
  Columns 1-19: The ratio in each PROMOD zone (defined by the variable PZ in the same file)
  Row 1: The ratio between the Class A representative cities loads and NLDAS
      2: The ratio between the Class B representative cities loads and NLDAS
      3: The ratio between the Class C representative cities loads and NLDAS
      4: The ratio between the Class D representative cities loads and NLDAS
      5: The ratio between the Class E representative cities loads and NLDAS
      6: The ratio between the Class F representative cities loads and NLDAS