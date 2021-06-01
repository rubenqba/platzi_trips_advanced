import 'package:platzi_trips_advanced/Place/model/place.dart';

class AppUser {
  final String? uid;
  final String name;
  final String email;
  final String avatarUrl;
  final List<Place> places;
  final List<Place> favoritePlaces;

  AppUser({
    this.uid,
    required this.name,
    required this.email,
    required this.avatarUrl,
    List<Place>? places,
    List<Place>? favorites,
  }) : this.places = places != null ? places : List.empty(growable: true),
        this.favoritePlaces = favorites != null ? favorites : List.empty(growable: true);

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "avatar": avatarUrl,
      "places": places,
      "favoritePlaces": favoritePlaces
    };
  }
}
