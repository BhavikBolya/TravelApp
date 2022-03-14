import 'package:df/df.dart';
import 'package:sortedmap/sortedmap.dart';
import 'package:deep_collection/deep_collection.dart';

// ignore: non_constant_identifier_names
Future<List> restaurant_algo(String inputCity, int inputDays, List inputCuisines) async {

  final df = await DataFrame.fromCsv('restaurants.csv', verbose: true);

  List shortlist = [];
  for (int i = 0; i < df.length; i++) {
    // ignore: unrelated_type_equality_checks
    if (df.colRecords('city', offset: i, limit: i + 1)[0].toString() == inputCity) {
      shortlist.add(i);
    }
  }
  List restaurantScore = [];

  for (int i = 0; i < shortlist.length; i++) {
    int score = 0;
    var cuisineIter = inputCuisines.iterator;
    String amn = df
        .colRecords('cuisines', offset: i, limit: i + 1)
        .toString()
        .replaceAll("[", "");
    amn = amn.replaceAll("]", "");
    amn = amn.replaceAll("'", "");
    while (cuisineIter.moveNext()) {
      if (amn.contains(cuisineIter.current)) {
        score++;
      }
    }
    restaurantScore.add(score);
  }
  Map<Comparable, dynamic> shortlist2 = SortedMap(const Ordering.byValue());

  for (int i = 0; i < shortlist.length; i++) {
    if (restaurantScore[i] >= 2) {
      shortlist2[shortlist[i]] = restaurantScore[i];
    }
  }
  shortlist2 = shortlist2.deepReverse();

  var shortlistedScores = <String, List>{
    '5_restaurants': [],
    '4_restaurants': [],
    '3_restaurants': [],
    '2_restaurants': []
  };

  for (MapEntry restaurant in shortlist2.entries) {
    if (restaurant.value == 5) shortlistedScores['5_restaurants']!.add(restaurant.key);
    if (restaurant.value == 4) shortlistedScores['4_restaurants']!.add(restaurant.key);
    if (restaurant.value == 3) shortlistedScores['3_restaurants']!.add(restaurant.key);
    if (restaurant.value == 2) shortlistedScores['2_restaurants']!.add(restaurant.key);
  }
  List restaurantRecc = [];

  Map<Comparable, dynamic> restaurants_5 = SortedMap(const Ordering.byValue());
  List h5 = shortlistedScores['5_restaurants']!.toList(growable: false);
  for (int i in h5) {
    restaurants_5[i] = double.parse(
        df.colRecords('rest_rating', offset: i, limit: i + 1)[0].toString());
  }
  restaurants_5 = restaurants_5.deepReverse();
  for (var x in restaurants_5.keys) {
    restaurantRecc.add(x);
  }

  Map<Comparable, dynamic> restaurants_4 = SortedMap(const Ordering.byValue());
  List h4 = shortlistedScores['4_restaurants']!.toList(growable: false);
  for (int i in h4) {
    restaurants_4[i] = double.parse(
        df.colRecords('rest_rating', offset: i, limit: i + 1)[0].toString());
  }
  restaurants_4 = restaurants_4.deepReverse();
  for (var x in restaurants_4.keys) {
    restaurantRecc.add(x);
  }

  Map<Comparable, dynamic> restaurants_3 = SortedMap(const Ordering.byValue());
  List h3 = shortlistedScores['3_restaurants']!.toList(growable: false);
  for (int i in h3) {
    restaurants_3[i] = double.parse(
        df.colRecords('rest_rating', offset: i, limit: i + 1)[0].toString());
  }
  restaurants_3 = restaurants_3.deepReverse();
  for (var x in restaurants_3.keys) {
    restaurantRecc.add(x);
  }

  Map<Comparable, dynamic> restaurants_2 = SortedMap(const Ordering.byValue());
  List h2 = shortlistedScores['2_restaurants']!.toList(growable: false);
  for (int i in h2) {
    restaurants_2[i] = double.parse(
        df.colRecords('rest_rating', offset: i, limit: i + 1)[0].toString());
  }
  restaurants_2 = restaurants_2.deepReverse();
  for (var x in restaurants_2.keys) {
    restaurantRecc.add(x);
  }
  int tot = inputDays*2;
  restaurantRecc = restaurantRecc.sublist(0, tot);
  var returnId = [];
  for (var restaurantId in restaurantRecc) {
    returnId.add(int.parse(df
        .colRecords('rest_id', offset: restaurantId, limit: restaurantId + 1)[0]
        .toString()));
  }
  return returnId;
  return [];
}
Future<void> main() async {
  List out = await restaurant_algo('Jaipur', 7, [
    "North Indian", "Chinese", "Mughlai", "Fast Food", "Biryani"
  ]);
  print(out);
}