# ASA-DataFest-2020

## Data Used
https://ieee-dataport.org/open-access/coronavirus-covid-19-tweets-dataset

[1] Rabindra Lamsal, "Coronavirus (COVID-19) Tweets Dataset", IEEE Dataport, 2020. [Online]. Available: http://dx.doi.org/10.21227/781w-ef42. Accessed: Jun. 05, 2020.
### Processing Data
#### Requirements
    * Python
    * Pandas


To process [the CSV files](https://ieee-dataport.org/open-access/coronavirus-covid-19-tweets-dataset), we must first extract the columns that contain the tweet IDs and then run them through a [Hydrator](https://github.com/DocNow/hydrator)
>Note: Update path in script as described in the comments

Once you've created a directory containing the CSV files, run the [getTweetIds.py](https://github.com/labib-c/ASA-DataFest-2020/tree/master/src/tools/getTweetIds.py) script to replace the CSV's to only contain the tweet IDs.

Once that is complete, you can then upload the CSV containing the tweet IDs to the Hydrator linked above.
>Note: You will need a Twitter Developer Account to be able to use the Hydrator.
