import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController{
  var _currentIndex = 0.obs;

  set currentIndex(index) => this._currentIndex.value = index;
  get currentIndex => this._currentIndex.value;

  void changeIndex(int index){
    this.currentIndex = index;
  }

}