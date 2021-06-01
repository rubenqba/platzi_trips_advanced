
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_advanced/Place/model/place.dart';
import 'package:platzi_trips_advanced/User/model/app_user.dart';

class CloudFirestoreApi {
   static const String USERS = "users";
   static const String PLACES = "places";

   final FirebaseFirestore _db = FirebaseFirestore.instance;
   final FirebaseAuth _auth = FirebaseAuth.instance;

   Future<void> updateAppUser(AppUser user) {
      DocumentReference ref = _db.collection(USERS).doc(user.uid);
      var userMap = user.toMap();
      userMap.putIfAbsent("lastSignIn", () => DateTime.now());
      return ref.set(userMap, SetOptions(merge: true));
   }
   
   Future<void> updatePlace(Place place) {
      var reference = _db.collection(PLACES);
      var placeMap = place.toMap();
      //var userRef = _db.collection(USERS).doc(_auth.currentUser!.uid);
      placeMap.update("owner", (value) => "${USERS}/${_auth.currentUser!.uid}");
      return reference.add(placeMap);
   }
}