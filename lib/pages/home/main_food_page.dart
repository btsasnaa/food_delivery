import 'package:flutter/material.dart';
import 'package:food_delivery/controller/popular_product_controller.dart';
import 'package:food_delivery/controller/recommended_product_controller.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Column(
          children: [
            // showing the header
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 45, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: 'Bangladesh',
                          color: AppColors.mainColor,
                          size: 30,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: 'City',
                              color: Colors.black54,
                            ),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search, color: Colors.white),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // showing the body
            Expanded(
                child: SingleChildScrollView(
              child: FoodPageBody(),
            )),
          ],
        ),
        onRefresh: _loadResources);

    // return Scaffold(
    //   body: Column(
    //     children: [
    //       // showing the header
    //       Container(
    //         child: Container(
    //           margin: EdgeInsets.only(top: 45, bottom: 15),
    //           padding: EdgeInsets.only(left: 20, right: 20),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Column(
    //                 children: [
    //                   BigText(
    //                     text: 'Bangladesh',
    //                     color: AppColors.mainColor,
    //                     size: 30,
    //                   ),
    //                   Row(
    //                     children: [
    //                       SmallText(
    //                         text: 'City',
    //                         color: Colors.black54,
    //                       ),
    //                       Icon(Icons.arrow_drop_down_rounded),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //               Container(
    //                 width: 45,
    //                 height: 45,
    //                 child: Icon(Icons.search, color: Colors.white),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(15),
    //                   color: AppColors.mainColor,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       // showing the body
    //       Expanded(
    //           child: SingleChildScrollView(
    //         child: FoodPageBody(),
    //       )),
    //     ],
    //   ),
    // );
  }
}
