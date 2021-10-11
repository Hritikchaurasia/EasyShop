import 'package:e_commerce_app_flutter/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectionCard extends StatelessWidget {
  final bool isSelected;
  final String title;
  final bool hasImage;
  final String image;

  const SelectionCard(
      {Key key,
      @required this.isSelected,
      @required this.title,
      this.image,
      this.hasImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConstants.DARK,
          borderRadius: BorderRadius.circular(20.0)),
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Radio(value: isSelected, groupValue: true, onChanged: (bool) {}),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250.0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: hasImage ? 20.0 : 16.0,
                  fontWeight: hasImage ? FontWeight.w700 : FontWeight.normal),
              overflow: TextOverflow.fade,
            ),
          ),
          hasImage
              ? SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: Image.network(
                    '',
                    fit: BoxFit.cover,
                  ))
              : Container(),
        ],
      ),
    );
  }
}
