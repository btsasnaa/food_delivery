import 'dart:io';

import 'package:food_delivery/data/repository/upload_repo.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:food_delivery/models/sign_in_body_model.dart';
import 'package:get/get.dart';

class UploadController extends GetxController implements GetxService {
  final UploadRepo uploadRepo;

  UploadController({
    required this.uploadRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> upload(String path) async {
    _isLoading = true;
    update();
    Response response = await uploadRepo.upload(path);
    late ResponseModel responseModel;
    print(response.body);
    if (response.statusCode == 200 && response.body["error"] == null) {
      responseModel = ResponseModel(true, response.body["path"]);
    } else {
      responseModel = ResponseModel(false, response.body["error"]);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
