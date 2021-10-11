import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product_card_controller.dart';
import '../../../model/product_mode.dart';
import '../../../utils/colors.dart';
import '../../widgets/banner.dart';
import '../../widgets/custome_button.dart';

class ProductCard extends StatelessWidget {
  //final Product product;
  const ProductCard({Key key, @required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final ProductCardController productCardController =
        Get.put(ProductCardController(product: product));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(product.name),
        centerTitle: true,
        actions: [
          Obx(() => IconButton(
                icon: productCardController.favourite.value ? Icon(Icons.favorite , color: Colors.red, ):Icon(Icons.favorite_border)  ,
                onPressed: () =>  productCardController.changeFavourite(),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return productCardController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: ColorConstants.WHITE,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    banner(
                      imageArray: product.imageURL,
                      height: 300,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 150,
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: ColorConstants.PRIMARY),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                //  value: productCardController.selectedSize.value,
                                hint: productCardController
                                            .selectedSize.value.length >
                                        1
                                    ? Text(
                                        productCardController
                                            .selectedSize.value,
                                        style: TextStyle(
                                            color: ColorConstants.WHITE),
                                      )
                                    : Text('Select size'),
                                onChanged: (String value) {
                                  productCardController.selectedSize.value =
                                      value;
                                },
                                items: product.size
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: ColorConstants.PRIMARY),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                //  value: 'this is value',
                                // value: productCardController.selectedColor.value,
                                hint: productCardController
                                            .selectedColor.value.length >
                                        1
                                    ? Text(
                                        productCardController
                                            .selectedColor.value,
                                        style: TextStyle(
                                            color: ColorConstants.WHITE),
                                      )
                                    : Text('Select size'),
                                onChanged: (String value) {
                                  productCardController.selectedColor.value =
                                      value;
                                  print(productCardController
                                      .selectedColor.value);
                                },
                                items: product.colors
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              product.brand,
                              style: const TextStyle(
                                  //   color: ColorConstants.WHITE,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 25.0),
                      child: Text(
                        product.category,
                        style: const TextStyle(
                          color: ColorConstants.GRAY,
                          fontSize: 10.0,
                          //fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15.0,
                            ),
                            Text(
                              '(10)',
                              style: const TextStyle(
                                color: ColorConstants.GRAY,
                                fontSize: 10.0,
                                //fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(product.description),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                        child: Obx(() => CustomeButton(
                            color: productCardController.addedToCart.value
                                ? ColorConstants.GRAY
                                : ColorConstants.PRIMARY,
                            title: productCardController.addedToCart.value
                                ? 'Added'
                                : 'Add To Cart',
                            fontSize: 30.0,
                            width: 300,
                            height: 50.0,
                            onTap: () {
                              // productCardController.isLoading.value = true;
                              productCardController.addedToCart.value
                                  ? print('Already added')
                                  : productCardController.addToCart(product);
                            
                            }))),
                  ],
                );
        }),
      ),
    );
  }
}
