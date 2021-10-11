import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/colors.dart';
import '../../widgets/BorderTextField.dart';
import '../../widgets/custome_button.dart';
import '../landing_page.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  static const String signUp = 'Don\'t have a account? SignUp';
  static const String login = 'Login';
  static const String emailHint = 'Enter your Email';
  static const String passwordHint = 'Enter your Password';
  static const String authFail = 'Authentication Fail';
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
  
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return authController.isLoading.value
              ? Center(
                  child: const CircularProgressIndicator(
                  backgroundColor: ColorConstants.WHITE,
                ))
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 80.0,
                        ),
                        const Text(
                          login,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 35.0,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        BorderTextField(
                          controller: authController.emailController,
                          hintText: emailHint,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        BorderTextField(
                          controller: authController.passwordController,
                          hintText: passwordHint,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        InkWell(
                          onTap: () async {
                           
                            // Get.offAll(LandingPage());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text('Forgot your Password ?'),
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
                            title: login,
                            onTap: () async {
                              await authController.signIn()
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
                        Center(
                          child: CustomeButton(
                            title: signUp,
                            onTap: () {
                              Get.to(SignUpPage());
                            },
                            height: 25.0,
                            width: MediaQuery.of(context).size.width * 0.7,
                            fontSize: 15.0,
                            color: ColorConstants.DARK,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
