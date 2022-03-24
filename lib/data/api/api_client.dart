import 'dart:io';

import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = getUserToken();
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': '$token',
    };
    print(_mainHeaders);
  }

  void updateHeader(String newToken) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': '$newToken',
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    try {
      Response response = await get(uri, headers: headers ?? _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postDataFile(String uri, String path) async {
    try {
      // DateTime now = DateTime.now();
      // String formattedDate = DateFormat('yyyyMMdd-hhmmsssss').format(now);
      // print(formattedDate);

      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyyMMdd-hhmmss-SSS').format(now);

      File file = File(path);
      final form = FormData({
        'file': MultipartFile(file, filename: formattedDate + ".jpg"),
      });
      Response response = await post(uri, form);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "None";
  }
}
