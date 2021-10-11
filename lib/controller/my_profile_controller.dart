import 'package:e_commerce_app_flutter/repositories/cloud_functions.dart';
import 'package:e_commerce_app_flutter/utils/storage.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController {
  var isLoading = true.obs;
  var userName = ''.obs;
  var email = ''.obs;
  var isNetworkError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUserDetail();
  }

  getUserDetail() async {
    isLoading.value = true;
    isNetworkError.value = false;
 //   print(Storage().getUid());
    try {
      final userdetails =
          await CloudFunctions().getUserDetail(Storage().getUid());
      
      userName.value = userdetails['userName'];
      email.value = userdetails['email'];
    } on Exception catch (e) {
      print('error is '+e.toString());
    isNetworkError.value = true;
    } catch (e) {
    
    isNetworkError.value = true;
    }
    isLoading.value = false;
  }
}
