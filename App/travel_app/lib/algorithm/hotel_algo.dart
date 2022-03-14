import 'package:df/df.dart';
import 'package:sortedmap/sortedmap.dart';
import 'package:deep_collection/deep_collection.dart';

Future<List> hotel_algo(String input_city,  int input_budget, int input_days, List input_amenities) async {
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
  double bugdetperday = input_budget / input_days;

  List shortlist = [];
  for (int i = 0; i < df.length; i++) {
    String st_price =
        df.colRecords('hotel_price', offset: i, limit: i + 1)[0].toString();
    double db_price = double.parse(st_price);
    // ignore: unrelated_type_equality_checks
    if (df.colRecords('city', offset: i, limit: i + 1)[0].toString() ==
            input_city &&
        db_price < bugdetperday) {
      shortlist.add(i);
    }
  }
  List hotel_score = [];

  for (int i = 0; i < shortlist.length; i++) {
    int score = 0;
    var amenityIter = input_amenities.iterator;
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
    hotel_score.add(score);
  }
  Map<Comparable, dynamic> shortlist2 = new SortedMap(Ordering.byValue());

  for (int i = 0; i < shortlist.length; i++) {
    if (hotel_score[i] >= 2) {
      shortlist2[shortlist[i]] = hotel_score[i];
    }
  }
  shortlist2 = shortlist2.deepReverse();
  var map = new Map();
  var shortlisted_scores = <String, List>{
    '5_hotels': [],
    '4_hotels': [],
    '3_hotels': [],
    '2_hotels': []
  };

  for (MapEntry hotel in shortlist2.entries) {
    if (hotel.value == 5) shortlisted_scores['5_hotels']!.add(hotel.key);
    if (hotel.value == 4) shortlisted_scores['4_hotels']!.add(hotel.key);
    if (hotel.value == 3) shortlisted_scores['3_hotels']!.add(hotel.key);
    if (hotel.value == 2) shortlisted_scores['2_hotels']!.add(hotel.key);
  }
  List hotel_recc = [];

  Map<Comparable, dynamic> hotels_5 = new SortedMap(Ordering.byValue());
  List h5 = shortlisted_scores['5_hotels']!.toList(growable: false);
  for (int i in h5)
    hotels_5[i] = double.parse(
        df.colRecords('hotel_rating', offset: i, limit: i + 1)[0].toString());
  hotels_5 = hotels_5.deepReverse();
  for (var x in hotels_5.keys) hotel_recc.add(x);

  Map<Comparable, dynamic> hotels_4 = new SortedMap(Ordering.byValue());
  List h4 = shortlisted_scores['4_hotels']!.toList(growable: false);
  for (int i in h4)
    hotels_4[i] = double.parse(
        df.colRecords('hotel_rating', offset: i, limit: i + 1)[0].toString());
  hotels_4 = hotels_4.deepReverse();
  for (var x in hotels_4.keys) hotel_recc.add(x);

  Map<Comparable, dynamic> hotels_3 = new SortedMap(Ordering.byValue());
  List h3 = shortlisted_scores['3_hotels']!.toList(growable: false);
  for (int i in h3)
    hotels_3[i] = double.parse(
        df.colRecords('hotel_rating', offset: i, limit: i + 1)[0].toString());
  hotels_3 = hotels_3.deepReverse();
  for (var x in hotels_3.keys) hotel_recc.add(x);

  Map<Comparable, dynamic> hotels_2 = new SortedMap(Ordering.byValue());
  List h2 = shortlisted_scores['2_hotels']!.toList(growable: false);
  for (int i in h2)
    hotels_2[i] = double.parse(
        df.colRecords('hotel_rating', offset: i, limit: i + 1)[0].toString());
  hotels_2 = hotels_2.deepReverse();
  for (var x in hotels_2.keys) hotel_recc.add(x);

  hotel_recc = hotel_recc.sublist(0, 3);
  var return_id = [];
  for (var hotel_id in hotel_recc)
    return_id.add(int.parse(df
        .colRecords('hotel_id', offset: hotel_id, limit: hotel_id + 1)[0]
        .toString()));

  return return_id;
}
