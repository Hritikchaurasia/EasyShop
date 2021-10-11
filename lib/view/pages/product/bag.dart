import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/bag_controller.dart';
import '../../../model/bag_model.dart';
import '../../../utils/colors.dart';
import '../../../utils/strings.dart';
import '../../widgets/bag_card.dart';
import '../../widgets/custome_button.dart';
import 'address_selection_page.dart';

class Bag extends StatelessWidget {
  const Bag({Key key}) : super(key: key);
 // static const Map<String, dynamic> map = {'test': 'success'};
  @override
  Widget build(BuildContext context) {
    final BagController bagController = Get.put(BagController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 80.0,
                ),
                const Text(
                  StringsConstants.myBag,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 35.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(child: Obx(() {
                  if (bagController.isLoading.value) {
                    return const Center(
                      child: const CircularProgressIndicator(
                        backgroundColor: ColorConstants.WHITE,
                      ),
                    );
                  } else if (bagController.isNetworkError.value) {
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
                              bagController.fetchBagItemList();
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else if (bagController.bagItemList.length < 1) {
                    return const Center(
                      child: Text('No item is currently bag'),
                    );
                  } else {
                    return Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx((){ return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: bagController.bagItemList.length,
                          itemBuilder: (context, index) {
                            final bagItem = bagController.bagItemList[index];
                            return BagCard(
                                product: BagModel(
                                    productName: bagItem.name,
                                    prductColor: bagItem.colors[0],
                                    productSize: bagItem.size[0],
                                    prodctQuantity: 1,
                                    productPrice: bagItem.price,
                                    productImg: bagItem.imageURL[0]));
                          },
                        );}),
                        Center(
                          child: Container(
                            margin:
                                const EdgeInsets.only(top: 25.0, bottom: 10.0),
                            child: Text(
                              'Total price is: \$${bagController.totalPrice}',
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CustomeButton(
                            title: 'Proceed',
                            onTap: () async {
                              Get.to(AddressSelectionPage());
                              // await bagController.checkout();

                              // print('checkout');
                            },
                            height: 40.0,
                            width: Get.width * 0.8,
                            fontSize: 30.0,
                          ),
                        ),
                      ],
                    );
                  }
                })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
