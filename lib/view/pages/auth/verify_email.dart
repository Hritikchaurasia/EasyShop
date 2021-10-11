import 'package:e_commerce_app_flutter/utils/colors.dart';
import 'package:e_commerce_app_flutter/view/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import 'sign_up_page.dart';


class VerifyEmail extends StatelessWidget {
  const VerifyEmail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
      return Scaffold(
    
      body: Center(child: Text('Please Verify email at ${authController.emailController.value.text}'
      , style:TextStyle(
        fontSize:30.0 ,
        
      )
      
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 100.0),
        child: FlatButton(
          color: ColorConstants.PRIMARY,
          
          onPressed: ()async{
            await authController.verifyUser();
            print(authController.isVerified.value);
            if(authController.isVerified.value) {Get.offAll(LandingPage());}
         
        },
        
        child: Text('Done'),
        ),
      ),
      
      );
    
  }
}