import 'package:platzi_trips_advanced/User/model/app_user.dart';

class Place {
  final String name;
  final String description;
  final String imageUrl;
  final int likes;
  final AppUser? owner;

  Place({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.likes = 0,
    this.owner
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "likes": likes,
      "owner": owner,
    };
  }
}