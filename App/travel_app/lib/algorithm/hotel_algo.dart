import 'package:df/df.dart';
import 'package:sortedmap/sortedmap.dart';
import 'package:deep_collection/deep_collection.dart';

Future<List> hotel_algo(String inputCity, int inputBudget, int inputDays,
    List inputAmenities) async {
  final df = await DataFrame.fromCsv('hotels.csv', verbose: true);
  // String input_city = "Jaipur";
  // int input_budget = 500;
  // int input_days = 7;
  // List input_amenities = [
  //   'Spa',
  //   'Pool',
  //   'Restaurant',
  //   'Bar',
  //   'Parking included'
  // ];
  double bugdetperday = inputBudget / inputDays;

  List shortlist = [];
  for (int i = 0; i < df.length; i++) {
    String stPrice =
        df.colRecords('hotel_price', offset: i, limit: i + 1)[0].toString();
    double dbPrice = double.parse(stPrice);
    // ignore: unrelated_type_equality_checks
    if (df.colRecords('city', offset: i, limit: i + 1)[0].toString() ==
            inputCity &&
        dbPrice < bugdetperday) {
      shortlist.add(i);
    }
  }
  List hotelScore = [];

  for (int i = 0; i < shortlist.length; i++) {
    int score = 0;
    var amenityIter = inputAmenities.iterator;
    String amn = df
        .colRecords('amenities', offset: i, limit: i + 1)
        .toString()
        .replaceAll("[", "");
    amn = amn.replaceAll("]", "");
    amn = amn.replaceAll("'", "");
    while (amenityIter.moveNext()) {
      if (amn.contains(amenityIter.current)) {
        score++;
      }
    }
    hotelScore.add(score);
  }
  Map<Comparable, dynamic> shortlist2 = SortedMap(const Ordering.byValue());

  for (int i = 0; i < shortlist.length; i++) {
    if (hotelScore[i] >= 2) {
      shortlist2[shortlist[i]] = hotelScore[i];
    }
  }
  shortlist2 = shortlist2.deepReverse();
  var shortlistedScores = <String, List>{
    '5_hotels': [],
    '4_hotels': [],
    '3_hotels': [],
    '2_hotels': []
  };

  for (MapEntry hotel in shortlist2.entries) {
    if (hotel.value == 5) shortlistedScores['5_hotels']!.add(hotel.key);
    if (hotel.value == 4) shortlistedScores['4_hotels']!.add(hotel.key);
    if (hotel.value == 3) shortlistedScores['3_hotels']!.add(hotel.key);
    if (hotel.value == 2) shortlistedScores['2_hotels']!.add(hotel.key);
  }
  List hotelRecc = [];

  Map<Comparable, dynamic> hotels_5 = SortedMap(const Ordering.byValue());
  List h5 = shortlistedScores['5_hotels']!.toList(growable: false);
  for (int i in h5) {
    hotels_5[i] = double.parse(
        df.colRecords('hotel_rating', offset: i, limit: i + 1)[0].toString());
  }
  hotels_5 = hotels_5.deepReverse();
  for (var x in hotels_5.keys) {
    hotelRecc.add(x);
  }

  Map<Comparable, dynamic> hotels_4 = SortedMap(const Ordering.byValue());
  List h4 = shortlistedScores['4_hotels']!.toList(growable: false);
  for (int i in h4) {
    hotels_4[i] = double.parse(
        df.colRecords('hotel_rating', offset: i, limit: i + 1)[0].toString());
  }
  hotels_4 = hotels_4.deepReverse();
  for (var x in hotels_4.keys) {
    hotelRecc.add(x);
  }

  Map<Comparable, dynamic> hotels_3 = SortedMap(const Ordering.byValue());
  List h3 = shortlistedScores['3_hotels']!.toList(growable: false);
  for (int i in h3) {
    hotels_3[i] = double.parse(
        df.colRecords('hotel_rating', offset: i, limit: i + 1)[0].toString());
  }
  hotels_3 = hotels_3.deepReverse();
  for (var x in hotels_3.keys) {
    hotelRecc.add(x);
  }

  Map<Comparable, dynamic> hotels_2 = SortedMap(const Ordering.byValue());
  List h2 = shortlistedScores['2_hotels']!.toList(growable: false);
  for (int i in h2) {
    hotels_2[i] = double.parse(
        df.colRecords('hotel_rating', offset: i, limit: i + 1)[0].toString());
  }
  hotels_2 = hotels_2.deepReverse();
  for (var x in hotels_2.keys) {
    hotelRecc.add(x);
  }

  hotelRecc = hotelRecc.sublist(0, 3);
  var returnId = [];
  for (var hotelId in hotelRecc) {
    returnId.add(int.parse(df
        .colRecords('hotel_id', offset: hotelId, limit: hotelId + 1)[0]
        .toString()));
  }
  return returnId;
}

Future<void> main() async {
  List out = await hotel_algo('Jaipur', 700, 5,
      ['Spa', 'Pool', 'Restaurant', 'Bar', 'Parking included']);
  print(out);
}
