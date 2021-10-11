import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/colors.dart';
import 'utils/storage.dart';
import 'view/pages/auth/login_page.dart';
import 'view/pages/landing_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce',

      theme: ThemeData(
        fontFamily: 'Metropolis',
        appBarTheme: AppBarTheme(color: ColorConstants.BACKGROUND),
        accentColor: ColorConstants.BACKGROUND,
        buttonColor: ColorConstants.PRIMARY,
        splashColor: ColorConstants.DARK,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorConstants.PRIMARY,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: ColorConstants.BACKGROUND,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: false,
      home: Storage().getLoginValue() ?  LandingPage() : LoginPage(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
