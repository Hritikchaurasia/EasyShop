import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app_flutter/model/product_mode.dart';
import 'package:e_commerce_app_flutter/repositories/cloud_functions.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  //obs variables
  var isLoading = false.obs;
  var isNetworkError = false.obs;
  var whatsnewList = <Product>[].obs;
  var trendingList = <Product>[].obs;
  var bannerList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomePageData();
  }

  Future fetchHomePageData({bool forceLoad = false}) async {
    if (forceLoad){ whatsnewList.clear();}
    if (whatsnewList.isEmpty) {
      isLoading.value = true;
      isNetworkError.value = false;
      bannerList.clear();

      try {
        final List<QueryDocumentSnapshot> resultWhatsNew =
            await CloudFunctions().getWhatsNew();
        final List<QueryDocumentSnapshot> resultTrending =
            await CloudFunctions().getTrending();

        final List<QueryDocumentSnapshot> bannerQuery = await CloudFunctions().getBannerImage();
        // print('result length is ${result.length}');
        whatsnewList.clear();
        trendingList.clear();
        resultWhatsNew.forEach((product) {
          // print('${product.data()}');
          whatsnewList.add(Product.fromMap(product.data()));
        });
        resultTrending.forEach((product) {
          trendingList.add(Product.fromMap(product.data()));
        });
        bannerQuery.forEach((image) { 
          bannerList.add(image.get('imageURL'));
        });
        isNetworkError.value = false;
      } on IOException {
        print('error occure ');
        isNetworkError.value = true;
      } catch (e) {
        print(e.toString());
        isNetworkError.value = true;
      }
      isLoading.value = false;
    }
  }
}
