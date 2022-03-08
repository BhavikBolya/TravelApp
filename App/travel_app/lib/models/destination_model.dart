import 'package:travel_app/models/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });
}

Set<Activity> activites = {
  Activity(
      imageUrl: 'assets/Images/jaipur.jpg',
      name: 'try1',
      type: 'tour',
      startTime: ['9:00 am', '11:00 pm'],
      rating: 5,
      price: 300),
};
