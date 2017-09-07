Figure_10_Data_Readme.txt

Filename format: [Figure_10_Data.mat]

Data contents: County level temperatures for the hottest 5-day period in 2008 in the Class A, Class F, and NLDAS datasets.

Data - Array of 5-day mean county-level temperatures for all counties in the WECC [393 x 3].
  Column 1: Peak temperatures in the NLDAS dataset
         2: Peak temperatures in the Class A representative cities dataset
	 3: Peak temperatures in the Class F representative cities dataset

Metadata - Array of county-level information for all counties in the WECC [393 x 11].
  Column 1: County FIPS number
         2: Population-weighted latitude (degrees north)
         3: Population-weighted longitude (degrees east)
         4: County population in the year 2014
         5: WECC PROMOD zone # (see Legend file for conversions)
         6: Matched Class A .EPW weather station identifier
         7: Matched Class A .EPW weather station latitude (degrees north)
	 8: Matched Class A .EPW weather station longitude (degrees east)
         9: Matched Class F .EPW weather station identifier
         10: Matched Class F .EPW weather station latitude (degrees north)
	 11: Matched Class F .EPW weather station longitude (degrees east)

Peak - The maximum temperature and center point for the heat wave in the Class A, Class F, and NLDAS datasets [5 x 3].
  Column 1: Heat wave statistics in the NLDAS dataset
	 2: Heat wave statistics in the Class A representative cities dataset
	 3: Heat wave statistics in the Class F representative cities dataset
  Row 1: Maximum temperature (degrees Celcius)
      2: Year of the peak heat wave center point (constrained to be in 2008 by definition)
      2: Month of the peak heat wave center point
      2: Day of the peak heat wave center point
      2: Hour of the peak heat wave center point

Metadata_Vectors - Structure containing the latitude and longitude vectors bounding each county in the WECC [393 x 1]. These vectors are used to plot the data in Matlab.

POline - Structure containing political boundaries used to plot the data in Matlab [1 x 2].