import 'dart:io';

import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/sign_in_body_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadRepo extends GetxService {
  final ApiClient apiClient;

  UploadRepo({
    required this.apiClient,
  });

  Future<Response> upload(String path) async {
    return await apiClient.postDataFile(AppConstants.UPLOAD_URI, path);
  }
}
