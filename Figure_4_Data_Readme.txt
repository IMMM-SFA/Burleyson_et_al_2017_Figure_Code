Figure_3_Data_Readme.txt

Filename format: [Figure_3_Data.mat]

Data contents: Data are shown for four example PROMOD zones in the WECC: CO-East, LADWP, WY, and SNev. The data format is consistent across all zones. We will use CO-East as an example.

CO_East_Data - Time series of zone mean temperature and load for every hour in the year 2010 [8760 x 8].
  Column 1: WECC PROMOD zone # (see Legend file for conversions)
         2: Matlab time
         3: Year
	 4: Month
	 5: Day
	 6: Hour
	 7: Zone mean temperature from the Class A representative cities (degrees Celcius)
	 8: Estimated total building load derived using the regression relationships (MW)

CO_East_Fit - The temperatures and loads used in the second order polynomial regressions [2 x 100]. Temperatures are binned into 100 bins for simplification in plotting.
  Column 1: Zone mean temperature from the Class A representative cities (degrees Celcius)
         2: Estimated total building load derived using the regression relationships (MW)

CO_East_Statistics - Temperature and corresponding load statistics from the NLDAS and representative cities datasets [4 x 2].
  Column 1: 2.5% of temperature and load from the representative cities dataset (degrees Celcius and MW)
         1: 2.5% of temperature and load from the NLDAS dataset (degrees Celcius and MW)
         1: 97.5% of temperature and load from the representative cities dataset (degrees Celcius and MW)
         1: 97.5% of temperature and load from the NLDAS dataset (degrees Celcius and MW)