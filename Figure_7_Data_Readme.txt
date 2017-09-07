Figure_5_Data_Readme.txt

Filename format: [Figure_5_Data_SEASON_ABBREVIATION.mat]
  SEASON_ABBREVIATION = [DJF, MAM, JJA, SON]

Data contents:

Metadata - Array of county-level information for all counties in the WECC [393 x 9].
  Column 1: County FIPS number
         2: Population-weighted latitude (degrees north)
         3: Population-weighted longitude (degrees east)
         4: County population in the year 2014
         5: WECC PROMOD zone # (see Legend file for conversions)
         6: Simplified IECC climate zone #
		3 = 2B
		5 = 3B
		6 = 3C
		8 = 4B
		9 = 4C
		11 = 5B
		13 = 6B
		15 = 7B
         7: Matched Class A .EPW weather station identifier
         8: Matched Class A .EPW weather station latitude (degrees north)
	 9: Matched Class A .EPW weather station longitude (degrees east)

Mean_T_Bias - Seasonal mean temperature bias for each of our six Classes (columns) [393 x 6].
  Column 1: Mean Class A temperature bias for each county (rows)
	 2: Mean Class B temperature bias for each county (rows)
	 3: Mean Class C temperature bias for each county (rows)
 	 4: Mean Class D temperature bias for each county (rows)
	 5: Mean Class E temperature bias for each county (rows)
	 6: Mean Class F temperature bias for each county (rows)

Metadata_Vectors - Structure containing the latitude and longitude vectors bounding each county in the WECC [393 x 1]. These vectors are used to plot the data in Matlab.

POline - Structure containing political boundaries used to plot the data in Matlab [1 x 2].