import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  var isLoading = false.obs;
  var selectedPostion = 0.obs;

  void changeValue(int changeValue) {
    selectedPostion.value = changeValue;
  }
}
