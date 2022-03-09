import 'dart:convert';

import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';
import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    print(response);
    if (response.statusCode == 200) {
      print('got data');
      _recommendedProductList = [];
      var _body = response.body;
      if (_body is String) {
        _body = jsonDecode(response.body);
      }
      _recommendedProductList.addAll(Product.fromJson(_body).products);
      // _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      print('failed to get data');
      print('failed ${response.statusText}');
    }
  }
}
