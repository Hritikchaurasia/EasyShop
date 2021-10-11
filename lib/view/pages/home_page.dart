import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homePage_controller.dart';
import '../../utils/colors.dart';
import '../widgets/banner.dart';
import '../widgets/item_card.dart';
import 'product/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      body: SafeArea(child: Obx(() {
        if (homePageController.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            backgroundColor: ColorConstants.WHITE,
          ));
        } else if (homePageController.isNetworkError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text('Error Occure'),
                const SizedBox(
                  height: 30.0,
                ),
                FlatButton(
                  color: ColorConstants.SALE,
                  onPressed: () {
                    homePageController.fetchHomePageData(forceLoad: true);
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else {
          return HomeItem();
        }
      })),
    );
  }
}

Widget HomeItem() {
  final HomePageController homePageController = Get.find();
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          banner(
              imageArray: homePageController.bannerList,
              height: Get.height * 0.6),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'What\'s New',
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 25.0),
              ),
              Text(
                '(${homePageController.whatsnewList.length})',
                style: const TextStyle(
                    color: ColorConstants.GRAY,
                    //fontWeight: FontWeight.w700,
                    fontSize: 18.0),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 200.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              //  physics: NeverScrollableScrollPhysics(),
              itemCount: homePageController.whatsnewList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => Get.to(ProductCard(
                          product: homePageController.whatsnewList[index],
                        )),
                    child: ItemCard(
                      product: homePageController.whatsnewList[index],
                    ));
              },
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 25.0),
              ),
              Text(
                '(${homePageController.whatsnewList.length})',
                style: const TextStyle(
                    color: ColorConstants.GRAY,
                    //fontWeight: FontWeight.w700,
                    fontSize: 18.0),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 200.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              //  physics: NeverScrollableScrollPhysics(),
              itemCount: homePageController.trendingList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => Get.to(ProductCard(
                          product: homePageController.trendingList[index],
                        )),
                    child: ItemCard(
                      product: homePageController.trendingList[index],
                    ));
              },
            ),
          ),
        ],
      ),
    ),
  );
}
