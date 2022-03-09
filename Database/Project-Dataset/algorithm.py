from unicodedata import category
import pandas as pd
import random

input_cat = []
print('''0 Adventure and Outdoor
1 Attractions
2 Water Activities
3 Shows and Concerts
4 History and Culture
5 Private and Custom Tours
6 Tours and Day Trips
7 Food, Drink and Nightlife
8 Classes and Workshops
9 Transportation
10 Air, Helicopter and Balloon Tours
11 Holiday and Seasonal Tours
12 Weddings and Honeymoons
13 Shopping and Fashion
14 Wildlife and Nature
15 Cruises and Boat Tours\n''')

input_cat = input("Select any 5 number - ").split()
input_days = int(input("Enter number of days : "))
input_city = input('Enter city: ')
cat = []
for i in input_cat:
    if i== '1':
        cat.append("Attractions")
    if i== '0':
        cat.append("Adventure and Outdoor")
    if i== '2':
        cat.append("Water Activities")
    if i== '3':
        cat.append("Shows and Concerts")
    if i== '4':
        cat.append("History and Culture")
    if i== '5':
        cat.append("Private and Custom Tours")
    if i== '6':
        cat.append("Tours and Day Trips")
    if i== '7':
        cat.append("Food, Drink and Nightlife")
    if i== '8':
        cat.append("Classes and Workshops")
    if i== '9':
        cat.append("Transportation")
    if i== '10':
        cat.append("Air, Helicopter and Balloon Tours")
    if i== '11':
        cat.append("Holiday and Seasonal Tours")
    if i== '12':
        cat.append("Weddings and Honeymoons")
    if i== '13':
        cat.append("Shopping and Fashion")
    if i== '14':
        cat.append("Wildlife and Nature")
    if i== '15':
        cat.append("Cruises and Boat Tours")


print(cat)

df = pd.read_csv('Database/Project-Dataset/Attractions.csv')
shortlist = []

for i in range(len(df.index)):
    if df.loc[i, 'attraction_category'] in cat:
            shortlist.append(i)

print(len(shortlist))

tour = []

for i in range(input_days):