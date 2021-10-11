import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app_flutter/utils/storage.dart';
import 'package:get/get.dart';

import '../model/product_mode.dart';
import '../repositories/cloud_functions.dart';

class FavouritesController extends GetxController {
  var isLoading = true.obs;
  var isNetworkError = false.obs;
  var favouritesList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavouritesData();
    print('init state');
  }

  Future fetchFavouritesData() async {
    isLoading.value = true;
    try {
      final List<QueryDocumentSnapshot> result =
          await CloudFunctions().getFromFavourites(Storage().getUid());
      favouritesList.clear();
      result.forEach((product) {
        print(product.data().toString());
        favouritesList.add(Product.fromMap(product.data()));
      });
    } on Exception {
      print('error occure');
      isNetworkError.value = true;
    } catch (e) {
      print(e.toString());
      isNetworkError.value = true;
    }
    //isNetworkError.value = true;
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }
}
