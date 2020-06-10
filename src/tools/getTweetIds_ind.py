import pandas as pd

# Replace the file name with the respective file you want to modify.
df = pd.read_csv('./corona_tweets_31.csv', header=0, delimiter=',')
df.drop(df.columns[[1]], axis=1, inplace=True)
df.to_csv('./corona_tweets_31.csv', index=False)