import 'package:flutter/material.dart';


class banner extends StatelessWidget {
  final List<String> imageArray;
  final double height;
  const banner({
    Key key, @required this.imageArray,@required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: imageArray.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      NetworkImage(imageArray[index]),
                  fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}