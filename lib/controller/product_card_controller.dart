import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:e_commerce_app_flutter/controller/bag_controller.dart';
import 'package:e_commerce_app_flutter/controller/favorites_controller.dart';
import 'package:e_commerce_app_flutter/model/product_mode.dart';
import 'package:e_commerce_app_flutter/repositories/cloud_functions.dart';
import 'package:e_commerce_app_flutter/utils/custome_function.dart';
import 'package:e_commerce_app_flutter/utils/storage.dart';

class ProductCardController extends GetxController {
  final Product product;
  final BagController bagController = Get.put(BagController());

  final FavouritesController favouritesController =
      Get.put(FavouritesController());
  var isLoading = false.obs;
  var selectedSize = ''.obs;
  var selectedColor = ''.obs;
  var addedToCart = false.obs;
  var favourite = false.obs;
  ProductCardController({@required this.product});

  void changeFavourite() async {
    await CloudFunctions().addToFavourites(product.toMap());
    await favouritesController.fetchFavouritesData();
    favourite.value = !favourite.value;
  }

  Future<bool> addToCart(Product product) async {
    isLoading.value = true;
    Map<String, dynamic> productMap = {
      'id': product.id,
      'name': product.name,
      'brand': product.brand,
      'category': product.category,
      'imageURL': listToMap(product.imageURL),
      'price': product.price,
      'colors': listToMap(selectedColor.value.length > 1
          ? [selectedColor.value]
          : [product.colors[0]]),
      'size': listToMap(selectedSize.value.length > 1
          ? [selectedSize.value]
          : [product.size[0]]),
      'description': product.description,
      'rating': product.rating,
    };
    await CloudFunctions().addToCart(Storage().getUid(), productMap);
    await bagController.fetchBagItemList();
    await favouritesController.fetchFavouritesData();
    addedToCart.value = true;
    isLoading.value = false;
  }
}
