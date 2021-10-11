import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../widgets/custome_button.dart';
import 'payment_page.dart';

class AddressSelectionPage extends StatelessWidget {
  const AddressSelectionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Enter Your Address ",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: height * 0.3,
                    child: Container(
                      color: ColorConstants.DARK,
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your Address'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //       Center(
                  //           child: CustomeButton(
                  //         title: 'Add Address',
                  //         onTap: () {},
                  //         width: 300.0,
                  //         fontSize: 20.0,
                  //         color: ColorConstants.DARK,
                  //       )),
                  //          SizedBox(
                  //   height: 20.0,
                  // ),
                  Center(
                      child: CustomeButton(
                    title: 'Proceed',
                    onTap: () =>  Get.to(PaymentPage()),
                    width: 350.0,
                    fontSize: 25.0,
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
