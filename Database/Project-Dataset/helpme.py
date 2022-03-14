import pandas as pd
import csv

def create_csv(fields, rows, dirname, filename):
    with open(dirname+filename, 'w', encoding='UTF8', newline='') as csvfile: 
        # creating a csv writer object
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(fields) 
        csvwriter.writerows(rows)
    print(f"Saved csv with name {filename}")


df1 = pd.read_csv("Database/Project-Dataset/restaurants.csv")
print(len(df1.index))


df2 = df1.drop_duplicates(subset ="rest_name", keep = 'first', inplace = False)
print(len(df2.index))



rest_info = []
for i in range(len(df2.index)):
    df2['restaurant_name'][i] = i+1
    rest_info1 = [i+1,df2['restaurant_name'][i],restaurant_url,restaurant_address, 'Jaisalmer', 'India', latitude, longitude, restaurant_location, restaurant_timing, restaurant_rating, restaurant_reviews, restaurant_about, cuisines, features, meals]
    rest_info.append(rest_info1)


# fields = ['rest_id', 'rest_name', 'rest_url', 'rest_address', 'city', 'country', "latitude", "longitude", 'location_url', 'rest_timing', 'rest_rating', 'rest_review', 'rest_about',  "cuisines", "features", "meals"]
# create_csv(fields, rest_info, "Project-Dataset/", "Jaisalmer_restaurant_info.csv")