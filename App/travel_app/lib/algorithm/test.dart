import 'package:df/df.dart';

Future<void> main() async {
  final df = await DataFrame.fromCsv('Rest.csv', verbose: true);
  for(int i=0;i<df.length;i++){
        df.colRecords('rest_id', offset: i, limit: i + 1)[0] = "pp";
  }
  print(df.colRecords('rest_id'));

}