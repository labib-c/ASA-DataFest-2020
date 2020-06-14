# ASA-DataFest-2020
We want to analyze the average sentiment among tweets during this Global Pandemic, and analyze whether the daily rise in new cases has an effect on the sentiment amongst Twitter users. 

## Data Used
https://covid.ourworldindata.org/data/ecdc/new_cases.csv

https://ieee-dataport.org/open-access/coronavirus-covid-19-tweets-dataset

https://zenodo.org/record/3884334

https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide

[1] Rabindra Lamsal. "Coronavirus (COVID-19) Tweets Dataset". IEEE Dataport, 2020. [Online]. Available: http://dx.doi.org/10.21227/781w-ef42. Accessed: Jun. 05, 2020.

[2] Banda, Juan M., Tekumalla, Ramya, Wang, Guanyu, Yu, Jingyuan, Liu, Tuo, Ding, Yuning, … Chowell, Gerardo. (2020). "A large-scale COVID-19 Twitter chatter dataset for open scientific research - an international collaboration (Version 13.0) [Data set]". Zenodo. http://doi.org/10.5281/zenodo.3884334. Accessed Jun. 13, 2020.

[3] “Download today’s data on the geographic distribution of COVID-19 cases worldwide.” 	
European Centre for Disease Prevention and Control, https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide. Accessed Jun. 13, 2020.

[4] Ritchie, Hannah. “Coronavirus Source Data.” Our World in Data, ourworldindata.org/coronavirus-source-data. Accessed Jun. 14, 2020.

### Processing Data
We need to process the data from https://ieee-dataport.org/open-access/coronavirus-covid-19-tweets-dataset as the datasets only contain the tweet IDs rather than the full tweet.
#### Requirements
    * Python
    * Pandas


To process [the CSV files](https://ieee-dataport.org/open-access/coronavirus-covid-19-tweets-dataset), we must first extract the columns that contain the tweet IDs and then run them through a [Hydrator](https://github.com/DocNow/hydrator)
>Note: Update path in script as described in the comments

Once you've created a directory containing the CSV files, run the [getTweetIds.py](https://github.com/labib-c/ASA-DataFest-2020/tree/master/src/tools/getTweetIds.py) script to replace the CSV's to only contain the tweet IDs.
```
python3 getTweetIds.py
```

Once that is complete, you can then upload the CSV containing the tweet IDs to the Hydrator linked above.
>Note: You will need a Twitter Developer Account to be able to use the Hydrator.
