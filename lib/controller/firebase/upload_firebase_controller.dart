import 'package:firebase_storage/firebase_storage.dart';

class UploadFirebaseController {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadFile(String path, String fileName) async {
    try {
      var result = await _firebaseStorage
          .ref()
          .child(path)
          .child(fileName)
          .putFile(fileName as dynamic);
      return await result.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      return e.message!;
    }
  }
}
