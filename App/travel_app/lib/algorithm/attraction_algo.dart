import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:df/df.dart';


// ignore: non_constant_identifier_names
Future<List> attraction_algo(String inputCity, int inputDays, List inputCategory) async {
  
  final df = await DataFrame.fromCsv('attractions.csv', verbose: true);

  // String inputCity = "Jodhpur";
  // int inputDays = 10;
  // List inputCategory = [
  //   'Adventure and Outdoor',
  //   'Tours and Day Trips',
  //   'History and Culture',
  //   'Wildlife and Nature',
  //   'Food, Drink and Nightlife',
  // ];

  Map<String,List> shortlist = {};
  for(int i =0 ; i<inputCategory.length; i++){
    shortlist.addEntries([
    MapEntry(inputCategory[i], [])
  ]);
  }
  for (int i = 0; i < df.length; i++) {
    // ignore: unrelated_type_equality_checks
    String flag = df
        .colRecords('attraction_category', offset: i, limit: i + 1)[0]
        .toString();
    if (df.colRecords('city', offset: i, limit: i + 1)[0].toString() == inputCity && inputCategory.contains(flag)) {
      shortlist[flag]!.add(i);
    }
  }

  List attractionRecc = [];
  int i = 0;
  String prevCat = "";
  while(i<inputDays){
    String randCat = randomChoice(shortlist.keys);
    if(prevCat==randCat) {
      continue;
    }
    List? idList = shortlist[randCat];
    var randId = randomChoice(idList!);
    attractionRecc.add(int.parse(df
        .colRecords('attraction_id', offset: randId, limit: randId + 1)[0]
        .toString()));
    prevCat=randCat;
    shortlist[randCat]!.remove(randId);
    i++;
  }
  return attractionRecc;
}
