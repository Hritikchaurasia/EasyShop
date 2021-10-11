import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/my_profile_controller.dart';
import '../../../utils/colors.dart';
import '../../../utils/settings_list.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyProfileController myProfileController =
        Get.put(MyProfileController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  'My Profile',
                  style: const TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ...[],
                Obx(() {
                  if (myProfileController.isLoading.value) {
                    return const Center(
                        child: CircularProgressIndicator(
                      backgroundColor: ColorConstants.WHITE,
                    ));
                  } else if (myProfileController.isNetworkError.value) {
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
                              myProfileController.getUserDetail();
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return UserCards();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget UserCards() {
    final MyProfileController myProfileController =
        Get.find<MyProfileController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  myProfileController.userName.value.toString(),
                  style: const TextStyle(fontSize: 25.0),
                ),
                 SizedBox(
          height: 10.0,
        ),
                Text(
                  myProfileController.email.value.toString(),
                  style: const TextStyle(
                      fontSize: 15.0, color: ColorConstants.GRAY),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: SettingsList.list.length,
          itemBuilder: (constext, index) {
            return ListTile(
              title: SettingsList.list[index],
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        )
      ],
    );
  }
}
