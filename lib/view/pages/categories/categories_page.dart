import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/bottom_navigation_bar_controller.dart';
import '../../../controller/catrgory_result_controller.dart';
import '../../../utils/categories_list.dart';
import '../../../utils/colors.dart';
import '../../widgets/custome_button.dart';
import 'category_result_page.dart';

class CategoriesPage extends StatelessWidget {
  static const chooseCategory = 'Choose category';
  const CategoriesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarController controller = Get.find<BottomNavigationBarController>();
    final CategoryResultController categoryResultController =
        Get.put(CategoryResultController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            controller.changeIndex(0);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Categories'),
        centerTitle: true,
        
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Center(
            //     child: CustomeButton(
            //   fontSize: 20.0,
            //   title: 'View All',
            //   onTap: () {},
            //   width: 350.0,
            // )),
            SizedBox(
              height: 20.0,
            ),
            Text(
              chooseCategory,
              style: TextStyle(fontSize: 15.0, color: ColorConstants.GRAY),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: CategoriesList.list.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          categoryResultController
                              .loadData(CategoriesList.textList[index]);
                          return Get.to(CategoryResultPage());
                        },
                        child: CategoriesList.list[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
