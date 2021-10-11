import 'package:e_commerce_app_flutter/view/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/colors.dart';
import '../../widgets/BorderTextField.dart';
import '../../widgets/custome_button.dart';
import 'verify_email.dart';

class SignUpPage extends StatelessWidget {
  static const String signup = 'Sign Up';
  static const String emailHint = 'Enter your Email';
  static const String passwordHint = 'Enter your Password';
  static const String usernameHint = 'Enter your UserName';
  static const String authFail = 'Authentication Fail';
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Scaffold(body: SafeArea(
      child: Obx(() {
        return authController.isLoading.value
            ? Center(
                child: const CircularProgressIndicator(
                  backgroundColor: ColorConstants.WHITE,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 30.0,
                      ),
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Text(
                        signup,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 35.0,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      BorderTextField(
                        hintText: usernameHint,
                        controller: authController.usernameController,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      BorderTextField(
                        hintText: emailHint,
                        controller: authController.emailController,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      BorderTextField(
                        hintText: passwordHint,
                        controller: authController.passwordController,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Already have an account?'),
                            Icon(
                              Icons.arrow_forward,
                              color: ColorConstants.PRIMARY,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: CustomeButton(
                          title: signup,
                          onTap: () async {
                            await authController.signUp()
                                ? Get.offAll(LandingPage())
                                : Get.snackbar(
                                    authFail, authController.errorText.value);
                          },
                          width: MediaQuery.of(context).size.width * 0.8,
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: <Widget>[
                          Container(),
                        ],
                      )
                    ],
                  ),
                ),
              );
      }),
    ));
  }
}
