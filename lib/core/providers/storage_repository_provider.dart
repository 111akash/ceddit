import 'package:ceddit/core/failure.dart';
import 'package:ceddit/core/type_defs.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fpdart/fpdart.dart';

class StorageRepository {
  final FirebaseStorage _firebaseStorage;
  StorageRepository({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  FutureEither<String> storeFile(
      {required String path, required String id}) async {
    try {
      _firebaseStorage.ref().child(path).child(id);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
