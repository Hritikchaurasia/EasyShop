import 'package:e_commerce_app_flutter/view/pages/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/catrgory_result_controller.dart';
import '../../../model/bag_model.dart';
import '../../../utils/colors.dart';
import '../../widgets/bag_card.dart';

class CategoryResultPage extends StatelessWidget {
  const CategoryResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryResultController categoryResultController =
        Get.find<CategoryResultController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
       
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Text(
                '${categoryResultController.selectedCategory.value}',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(child: Obx(() {
                if (categoryResultController.isLoading.value) {
                  return const CircularProgressIndicator(
                    backgroundColor: ColorConstants.WHITE,
                  );
                } else if (categoryResultController.isNetworkError.value) {
                  return Center(
                    child: Column(
                      children: [
                        const Text('Error Occure'),
                        const SizedBox(
                          height: 30.0,
                        ),
                        FlatButton(
                          color: ColorConstants.SALE,
                          onPressed: () {
                            categoryResultController.loadData(
                                categoryResultController
                                    .selectedCategory.value);
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ItemList();
                }
              })),
            ],
          ),
        ),
      ),
    );
  }

  Widget ItemList() {
    final CategoryResultController categoryResultController = Get.find<CategoryResultController>();
    return Obx(() => ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: categoryResultController.resultList.length,
          itemBuilder: (context, index) {
            final product = categoryResultController.resultList[index];
            return GestureDetector(
              onTap: () => Get.to(ProductCard(
                product: product,
              )),
              child: BagCard(
                  product: BagModel(
                      productName: product.name,
                      prductColor: product.colors[0],
                      productSize: product.size[0],
                      prodctQuantity: 1,
                      productPrice: product.price,
                      productImg: product.imageURL[0])),
            );
          },
        ));
  }
}
