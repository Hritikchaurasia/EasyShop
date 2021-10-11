import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottom_navigation_bar_controller.dart';
import '../../utils/colors.dart';
import 'categories/categories_page.dart';
import 'favorites/favorites.dart';
import 'home_page.dart';
import 'product/bag.dart';
import 'profile/my_profile.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const listRoute = const[
      HomePage(),
      CategoriesPage(),
      Bag(),
      Favorites(),
      MyProfile()
    ];

    final BottomNavigationBarController bottomNavigationController =
        Get.put(BottomNavigationBarController());
    return Scaffold(
      body: Obx(() {
        return listRoute[bottomNavigationController.currentIndex];
      }),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: bottomNavigationController.currentIndex,
            backgroundColor: ColorConstants.BACKGROUND,
            onTap: (index) => bottomNavigationController.changeIndex(index),
            selectedItemColor: ColorConstants.PRIMARY,
            unselectedItemColor: ColorConstants.GRAY,
            items: const [
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Home'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Categories'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: 'Bag'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  label: 'Profile'),
            ],
          )),
    );
  }
}
