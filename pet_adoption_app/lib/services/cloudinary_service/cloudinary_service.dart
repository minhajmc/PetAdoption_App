import 'dart:developer';

import 'package:dio/dio.dart';

class CloudinaryService {
  static Future<String?> uploadImageToCloudinary(
      final uploadPreset, String? imageFilePath) async {
    if (imageFilePath == null || imageFilePath.isEmpty) {
      return null;
    }

    final url = 'https://api.cloudinary.com/v1_1/doy2489xz/image/upload';

    final formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(imageFilePath),
      "upload_preset": "$uploadPreset"
    });

    Dio dio = Dio();
    final response = await dio.post(url, data: formData);

    try {
      if (response.statusCode == 200) {
        // we can extract the secure URL from the response
        log("url of cloudinary image ${response.data["secure_url"]}");
        return response.data["secure_url"];
      }
    } catch (e) {
      log("error ocuured when uploading images to cloudinary $e");
      return null;
    }
  }
}
