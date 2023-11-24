import 'dart:typed_data';

import 'package:http/http.dart' as http;

class HttpDonwloadAPIController {
  Future<Uint8List> downloadImage(String url) async {
    final response = await http.get(Uri.parse(url));

    // Convert the response body to Uint8List
    var imageBytes = response.bodyBytes;

    return imageBytes;
  }
}
