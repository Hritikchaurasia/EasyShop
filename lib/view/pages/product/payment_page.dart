import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/bag_controller.dart';
import '../../../controller/payment_method_controller.dart';
import '../../../utils/colors.dart';
import '../../widgets/custome_button.dart';
import '../../widgets/selection_card.dart';
import '../landing_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    final BagController bagController = Get.find<BagController>();
    final PaymentMethodController paymentMethodController =
        Get.put(PaymentMethodController());
    final height = Get.height;

    void changeActivePaymentValue(int value) {
      paymentMethodController.changeValue(value);
      //setState(() {});
      debugPrint(value.toString());
    }

    return Scaffold(
      body: SingleChildScrollView(
              child:
               Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Obx(
                    (){
                      if(paymentMethodController.isLoading.value){

                           return      SizedBox(
                             height: height,
                             child: const Center(
              child: const CircularProgressIndicator(
                backgroundColor: ColorConstants.WHITE,
              ),
            ),
                           );
                      }
                      else{ return Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Select Payment Method",
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            height: height * 0.7,
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () => changeActivePaymentValue(0),
                                    child: SelectionCard(
                                      isSelected: paymentMethodController
                                                  .selectedPostion.value ==
                                              0
                                          ? true
                                          : false,
                                      title: 'Cash',
                                      hasImage: true,
                                      image: 'https://upload.wikimedia.org/wikipedia/commons/c/c5/Square_Cash_app_logo.svg',
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => changeActivePaymentValue(1),
                                    child: SelectionCard(
                                      isSelected: paymentMethodController
                                                  .selectedPostion.value ==
                                              1
                                          ? true
                                          : false,
                                      title: 'Card',
                                      hasImage: true,
                                      image: 'https://www.collinsdictionary.com/images/thumb/card_199913294_250.jpg?version=4.0.185',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Center(
                              child: CustomeButton(
                            title: 'CheckOut',
                            onTap: () async {
                              paymentMethodController.isLoading.value = true;
                              await bagController.checkout();
                             await  Future.delayed(Duration(seconds: 1));
                             paymentMethodController.isLoading.value = false;
                             Get.offAll(LandingPage());
                            },
                            width: 350.0,
                            fontSize: 25.0,
                          ))
                        ],
                      ),
                    );}},
                  ),
                ],
              ),
            ),
    );
  }
}
