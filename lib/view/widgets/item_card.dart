import 'package:flutter/material.dart';

import '../../model/product_mode.dart';
import '../../utils/colors.dart';
import 'custome_button.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  const ItemCard({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0),
      width: 120,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                    image: NetworkImage(product.imageURL[0]),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            left: 5.0,
            top: 5.0,
            child: CustomeButton(
              title: '-30%',
              onTap: () {},
              height: 0.0,
              width: 40.0,
              fontSize: 10.0,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...[
                      Icon(Icons.star_rate, size: 10.0),
                      Icon(Icons.star_rate, size: 10.0),
                      Icon(Icons.star_rate, size: 10.0),
                    ]
                    //    ],),
                    ,
                    Text(
                      '(10)',
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  product.name,
                  style: TextStyle(color: ColorConstants.GRAY, fontSize: 10.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(product.category),
                SizedBox(
                  height: 5.0,
                ),
                Text('\$${product.price}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
