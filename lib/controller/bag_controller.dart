import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app_flutter/model/product_mode.dart';
import 'package:e_commerce_app_flutter/repositories/cloud_functions.dart';
import 'package:e_commerce_app_flutter/utils/storage.dart';
import 'package:get/get.dart';

class BagController extends GetxController {
  var isLoading = true.obs;
  var isNetworkError = false.obs;
  var bagItemList = <Product>[].obs;
  var totalPrice = 0.0.obs;


  @override
  void onInit() {
    super.onInit();
    fetchBagItemList();
  }

 Future checkout() async{
 //  isLoading.value = true;
   totalPrice.value = 0.0;
   await CloudFunctions().checkout();
   await CloudFunctions().checkout();
  bagItemList.clear();

   await fetchBagItemList();
  
 }

 Future  fetchBagItemList() async {
//  await  Future.delayed(Duration(seconds: 10));
   isLoading.value = true;
    isNetworkError.value = false;
   try {
      final List<QueryDocumentSnapshot> result =
        await CloudFunctions().getFromCart(Storage().getUid());
    bagItemList.clear();
    result.forEach((product) {
      
      bagItemList.add(Product.fromMap(product.data()));
      totalPrice = totalPrice + product.get('price').toDouble();
    });
    //result.forEach((e) { })
    
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
}
