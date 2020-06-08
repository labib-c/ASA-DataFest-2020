import pandas as pd
import glob

# Update path to directory where your CSV files are
path = "/Users/labibchowdhury/Projects/ASA-DataFest-2020/covid-tweets/*.csv"
for fname in glob.glob(path):
    # you can pull this out of the for loop as well to just modify a single  CSV file 
    # or modify for loop to handle a subset of CSV files
    df = pd.read_csv(fname, header=0, delimiter=',')
    df = df.drop(df.columns[[0]], axis=1)
    df.to_csv(fname, index=False)