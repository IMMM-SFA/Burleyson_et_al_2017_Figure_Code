Figure_2_Data_Readme.txt

Filename format: [Figure_2_Data.mat]

Data contents: Temperatures and biases in each county in the WECC on 5-July 2008 at 20:00 UTC 

Data - Array of county-level information for all counties in the WECC [393 x 12].
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
         10: Temperature from the associated weather station (degrees Celcius)
         11: Temperature from NLDAS (degrees Celcius)
 	 12: Temperature difference between NLDAS and the representative cities (degrees Celcius)	

Metadata_Vectors - Structure containing the latitude and longitude vectors bounding each county in the WECC [393 x 1]. These vectors are used to plot the data in Matlab.

POline - Structure containing political boundaries used to plot the data in Matlab [1 x 2].