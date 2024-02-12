import 'package:ceddit/core/constants/firebase_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileRepository {
  final FirebaseFirestore _firestore;
  UserProfileRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);
}
