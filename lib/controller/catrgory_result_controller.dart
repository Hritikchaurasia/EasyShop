import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/product_mode.dart';
import '../repositories/cloud_functions.dart';

class CategoryResultController extends GetxController {
  var isLoading = true.obs;
  var selectedCategory = ''.obs;
  var resultList = <Product>[].obs;
  var isNetworkError = false.obs;

  loadData(String value) async {
    isLoading.value = true;
    isNetworkError.value = false;
    selectedCategory.value = value;

    try {
    final List<QueryDocumentSnapshot> result =
        await CloudFunctions().getCategories(value);
    resultList.clear();
    result.forEach((product) {
      print(product.data());

      resultList.add(Product.fromMap(product.data()));
    });
    print('size of resultList = ${resultList.length}');
    }
    on IOException{
      print('error occure ');
      isNetworkError.value = true;
    }
    catch (e) {
      print('error occure $e');
      isNetworkError.value = true;
    }

    isLoading.value = false;
  }
}
