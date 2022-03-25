import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/address_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo extends GetxService {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> getAddressFromGeocode(LatLng latlng) async {
    return await apiClient.getData(
        '${AppConstants.GEOCODE_URI}?lat=${latlng.latitude}&lng=${latlng.longitude}');
  }

  String getUserAddress() {
    print(":::::aaaaaa");
    print(sharedPreferences.getString(AppConstants.USER_ADDRESS));
    print(":::::bbbbbb");
    return sharedPreferences.getString(AppConstants.USER_ADDRESS) ?? "";
  }

  Future<Response> addAddress(AddressModel addressModel) async {
    return await apiClient.postData(
        AppConstants.ADD_ADDRESS_URI, addressModel.toJson());
  }

  Future<Response> getAllAddress() async {
    return await apiClient.getData(AppConstants.ADDRESS_LIST_URI);
  }

  Future<bool> saveUserAddress(String address) async {
    // apiClient.updateHeader(newToken)
    return await sharedPreferences.setString(
        AppConstants.USER_ADDRESS, address);
  }
}
