import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class BorderTextField extends StatelessWidget {
  TextEditingController controller;
  final String hintText;
  BorderTextField({Key key, this.controller, @required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: ColorConstants.DARK),
      child: TextField(
          controller: controller,
          cursorColor: ColorConstants.WHITE,
          decoration: InputDecoration(

              // labelStyle: TextStyle(color: ColorConstants.WHITE),
              // labelText: 'Email',
              focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(width: 0.0),
              ),
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0.0),
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorConstants.PRIMARY, width: 0.0),
              ))),
    );
  }
}
