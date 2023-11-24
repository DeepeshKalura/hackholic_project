import 'dart:typed_data';
import 'dart:developer' as developer;
import 'package:image_picker/image_picker.dart';

class UploadDataFromDeviceLocalController {
  final ImagePicker _picker = ImagePicker();

  Future<Uint8List?> getImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image == null) {
        // User canceled the operation
        return null;
      } else {
        // Convert the image to Uint8List
        List<int> bytes = await image.readAsBytes();
        return Uint8List.fromList(bytes);
      }
    } catch (e) {
      developer.log('Error picking image from camera: $e');
      return null;
    }
  }

  Future<Uint8List?> getImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image == null) {
        // User canceled the operation
        return null;
      } else {
        // Convert the image to Uint8List
        List<int> bytes = await image.readAsBytes();
        return Uint8List.fromList(bytes);
      }
    } catch (e) {
      developer.log('Error picking image from gallery: $e');
      return null;
    }
  }
}
