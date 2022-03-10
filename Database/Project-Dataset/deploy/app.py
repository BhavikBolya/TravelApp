from unittest import result
from flask import Flask, jsonify, request
import pandas as pd


app = Flask(__name__)
@app.route("/recc", method =['POST'])

def response():
    query = dict(request.form)['query']
    result = hotel_recc()
    return jsonify({"response" : result})

if __name__ == '__main__' :
    app.run(host="0.0.0.0",)

def hotel_recc(input_city, input_budget, input_days, input_amenities):
    df = pd.read_csv('Database/Project-Dataset/Hotels.csv')
    bugdetperday = input_budget/input_days

    city = ""
    if input_city == 1:
        city = "Jaipur"
    elif input_city == 2:
        city = "Udaipur"
    elif input_city == 3:
        city = "Jaisalmer"
    elif input_city == 4:
        city = "Jodhpur"

    shortlist = []

    for i in range(len(df.index)):
        if df.loc[i, 'city'] == city and df.loc[i, 'hotel_price'] < bugdetperday:
                shortlist.append(i)

    amenities = []
    for amenity in input_amenities:
        if amenity == '1':
            amenities.append("Spa")
        elif amenity == '2':
            amenities.append("Parking included")
        elif amenity == '3':
            amenities.append("Laundry")
        elif amenity == '4':
            amenities.append("Pet friendly")
        elif amenity == '5':
            amenities.append("Hot Tub")
        elif amenity == '6':
            amenities.append("Pool")
        elif amenity == '7':
            amenities.append("Restaurant")
        elif amenity == '8':
            amenities.append("Business services")
        elif amenity == '9':
            amenities.append("Free airport shuttle")
        elif amenity == '10':
            amenities.append("24/7 front desk")
        elif amenity == '11':
            amenities.append("Babysitting")
        elif amenity == '12':
            amenities.append("Gym")
        elif amenity == '13':
            amenities.append("Kitchen")
        elif amenity == '14':
            amenities.append("Bar")
        elif amenity == '15':
            amenities.append("Parking available")
        elif amenity == '16':
            amenities.append("Outdoor Space")
        elif amenity == '17':
            amenities.append("Barbecue grill")
        elif amenity == '18':
            amenities.append("Fireplace")

    hotel_score = []

    # print(amenities)

    for i in shortlist:
        score = 0
        for amenity in amenities:
            if amenity in df.loc[i, 'amenities']:
                score+=1
        hotel_score.append(score)

    shortlist2 = {}

    for i in range(len(shortlist)):
        if hotel_score[i] >= 2:
            shortlist2[shortlist[i]] = hotel_score[i]

    sorted_shortlist = sorted(shortlist2.items(), key=lambda x: x[1], reverse=True)
    # sorted_shortlist = sorted_shortlist[0:9]

    shortlisted_scores = {5:0,'5_hotels':[], 4:0, '4_hotels':[], 3:0, '3_hotels':[], 2:0, '2_hotels':[]}

    for hotel in sorted_shortlist:
        if hotel[1] == 5:
            shortlisted_scores[5] += 1
            shortlisted_scores['5_hotels'].append(hotel[0])
        if hotel[1] == 4:
            shortlisted_scores[4] += 1
            shortlisted_scores['4_hotels'].append(hotel[0])
        if hotel[1] == 3:
            shortlisted_scores[3] += 1
            shortlisted_scores['3_hotels'].append(hotel[0])
        if hotel[1] == 2:
            shortlisted_scores[2] += 1
            shortlisted_scores['2_hotels'].append(hotel[0])

    hotel_recc = []

    hotels_5 = {}
    for i in shortlisted_scores['5_hotels']:
        hotels_5[i] = df.loc[i, 'hotel_rating']
    sorted_hotels_5 = sorted(hotels_5.items(), key=lambda x: x[1], reverse=True)
    for x in sorted_hotels_5:
        hotel_recc.append(x[0])

    hotels_4 = {}
    for i in shortlisted_scores['4_hotels']:
        hotels_4[i] = df.loc[i, 'hotel_rating']
    sorted_hotels_4 = sorted(hotels_4.items(), key=lambda x: x[1], reverse=True)
    for x in sorted_hotels_4:
        hotel_recc.append(x[0])

    hotels_3 = {}
    for i in shortlisted_scores['3_hotels']:
        hotels_3[i] = df.loc[i, 'hotel_rating']
    sorted_hotels_3 = sorted(hotels_3.items(), key=lambda x: x[1], reverse=True)
    for x in sorted_hotels_3:
        hotel_recc.append(x[0])

    hotels_2 = {}
    for i in shortlisted_scores['2_hotels']:
        hotels_2[i] = df.loc[i, 'hotel_rating']
    sorted_hotels_2 = sorted(hotels_2.items(), key=lambda x: x[1], reverse=True)
    for x in sorted_hotels_2:
        hotel_recc.append(x[0])

    hotel_recc = hotel_recc[0:3]
    return_id = []
    for hotel_id in hotel_recc:
        return_id.append(df.loc[hotel_id, 'hotel_id'])
    
    return return_id