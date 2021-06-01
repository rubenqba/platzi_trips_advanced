
import 'package:platzi_trips_advanced/Place/model/place.dart';
import 'package:platzi_trips_advanced/User/model/app_user.dart';
import 'package:platzi_trips_advanced/User/repository/cloud_firestore_api.dart';

class CloudStorageRepository {

  final CloudFirestoreApi _api = CloudFirestoreApi();

  Future<void> updateUser(AppUser user) => _api.updateAppUser(user);

  Future<void> updatePlace(Place place) => _api.updatePlace(place);
}