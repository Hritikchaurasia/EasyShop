import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../landing_page.dart';

class GoogleLoginPage extends StatelessWidget {
  const GoogleLoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/login_page.png',
                height: Get.height * 0.4,
                width: Get.width,
              ),
              // Container(

              //   width: Get.width * 0.5,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage(
              //             'assets/login_page.png',
              //           ),
              //           fit: BoxFit.cover)),
              // ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  return Get.offAll(LandingPage());
                },
                child: Container(
                  height: 50,
                  width: 100,
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage('assets/google_logo.jpg'),
                          fit: BoxFit.cover)),
                  // child:Image.asset('assets/google_logo.jpg', fit:BoxFit.cover)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
