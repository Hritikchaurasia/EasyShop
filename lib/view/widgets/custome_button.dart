import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomeButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final double height;
  final double width;
  final double fontSize;
  final Color color ;
  const CustomeButton({
    Key key,
    this.title,
    this.onTap,
    this.height = 40.0,
    this.width, this.fontSize, this.color = ColorConstants.PRIMARY

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(vertical: 5.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0)),
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}
