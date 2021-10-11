import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorites_controller.dart';
import '../../../utils/colors.dart';
import '../../widgets/item_card.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavouritesController favouritesController =
        Get.put(FavouritesController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          centerTitle: true,
        ),
        body: Container(child: Obx(() {
          if (favouritesController.isLoading.value) {
            return const Center(
              child: const CircularProgressIndicator(
                backgroundColor: ColorConstants.WHITE,
              ),
            );
          } else if (favouritesController.isNetworkError.value) {
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
                      favouritesController.fetchFavouritesData();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (favouritesController.favouritesList.length < 1) {
            return Center(
              child: Text('No item is currently favourites'),
            );
          } else {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: favouritesController.favouritesList.length,
              itemBuilder: (context, index) {
                return ItemCard(product : favouritesController.favouritesList[index]);
              },
            );
          }
        })));
  }
}
