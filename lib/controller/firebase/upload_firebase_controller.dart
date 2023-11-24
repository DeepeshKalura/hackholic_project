import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class UploadFirebaseController {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  /// will get the download url of the file
  Future<String> uploadFile(
      String path, String fileName, Uint8List data) async {
    try {
      var result = await _firebaseStorage
          .ref()
          .child(path)
          .child(fileName)
          .putData(data);

      return await result.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      return e.message!;
    }
  }
}
