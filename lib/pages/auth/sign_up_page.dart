import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/base/show_custom_message.dart';
import 'package:food_delivery/controller/auth_controller.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/route/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "empty_cart.png",
      "empty_box.png",
      "flutter_logo.jpg",
    ];

    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomerSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomerSnackBar("Type in your phone", title: "Phone");
      } else if (email.isEmpty) {
        showCustomerSnackBar("Type in your email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomerSnackBar("Type in valid email address",
            title: "Email address");
      } else if (password.isEmpty) {
        showCustomerSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomerSnackBar("Password can not be less than six characters",
            title: "Password");
      } else {
        SignUpBody signUpBody = SignUpBody(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            print("success registration");
            Get.offNamed(RouteHelper.getInitial());
          } else {
            showCustomerSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController) {
        return !_authController.isLoading
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: Dimensions.screenHeight * 0.05),
                    // logo
                    Container(
                      height: Dimensions.screenHeight * 0.25,
                      child: Center(
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            backgroundImage:
                                AssetImage("assets/image/flutter_logo.jpg")),
                      ),
                    ),
                    // email
                    AppTextField(
                      textController: emailController,
                      hintText: "Email",
                      icon: Icons.email,
                    ),
                    SizedBox(height: Dimensions.height20),
                    // password
                    AppTextField(
                      textController: passwordController,
                      hintText: "Password",
                      icon: Icons.password_sharp,
                      isObscure: true,
                    ),
                    SizedBox(height: Dimensions.height20),
                    // name
                    AppTextField(
                      textController: nameController,
                      hintText: "Name",
                      icon: Icons.person,
                    ),
                    SizedBox(height: Dimensions.height20),
                    // phone
                    AppTextField(
                      textController: phoneController,
                      hintText: "Phone",
                      icon: Icons.phone,
                    ),
                    SizedBox(height: Dimensions.height20),
                    // sign up
                    GestureDetector(
                      onTap: () {
                        _registration(_authController);
                      },
                      child: Container(
                        width: Dimensions.screenWidth / 2,
                        height: Dimensions.screenHeight / 13,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius30),
                            color: AppColors.mainColor),
                        child: Center(
                          child: BigText(
                            text: "Sign up",
                            size: Dimensions.font20 * 3 / 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height10),
                    // have an account alreade? link
                    RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: "Have an account already?",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
                    // signup options
                    RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: "Sign up using one of the following methods",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font16,
                        ),
                      ),
                    ),
                    Wrap(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: Dimensions.radius30,
                                  backgroundImage: AssetImage(
                                      "assets/image/" + signUpImages[index]),
                                ),
                              )),
                    ),
                  ],
                ),
              )
            : CustomLoader();
      }),
    );
  }
}
