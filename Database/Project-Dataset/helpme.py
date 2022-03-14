import pandas as pd
import csv

def create_csv(fields, rows, dirname, filename):
    with open(dirname+filename, 'w', encoding='UTF8', newline='') as csvfile: 
        # creating a csv writer object
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(fields) 
        csvwriter.writerows(rows)
    print(f"Saved csv with name {filename}")


df1 = pd.read_csv("Database/Project-Dataset/rest.csv")

rest_info = []
for i in range(len(df1.index)):
    ls = [i+1]+df1.loc[i].values.tolist()[1:]
    rest_info.append(ls)

print(len(rest_info))

fields = ['rest_id', 'rest_name', 'rest_url', 'rest_address', 'city', "latitude", "longitude",  'rest_timing', 'rest_rating', "cuisines", "features"]
create_csv(fields, rest_info, "Database/Project-Dataset/", "Rest1.csv")