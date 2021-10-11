import 'package:flutter/material.dart';

import '../../model/bag_model.dart';
import '../../utils/colors.dart';

class BagCard extends StatelessWidget {
  final BagModel product;
  const BagCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;
    return Container(
      width: size.width *0.7,
      height: size.height * 0.15,
      margin: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
                  bottomLeft: const Radius.circular(20.0),
                  topLeft: const Radius.circular(20.0)),
          
            child: Image.asset(
              
              product.productImg,
         
            
            ),
          ),
          Container(
            width: size.width *0.65,
            
            decoration: const BoxDecoration(
              color: ColorConstants.DARK,
              borderRadius: const BorderRadius.only(
                  bottomRight: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0)),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text(product.productName , style: TextStyle(
                  fontSize: 25.0

                ),),
                SizedBox(height: 5.0,),
                Row(
                  children: [
                    Text('Color: ${product.prductColor}' ,style: TextStyle(
                      fontSize: 10.0,
                      color: ColorConstants.GRAY
                    ), ),
                      SizedBox(width: 10.0,),
                    Text('Size: ${product.productSize}' ,style: TextStyle(
                      fontSize: 10.0,
                      color: ColorConstants.GRAY
                    ), ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                   Expanded(
                     child: Text('Quantity: ${product.prodctQuantity}' ,style: TextStyle(
                        fontSize: 20.0,
                        
                      ), ),
                   ),
                   Text('${product.productPrice}\$' ,style: TextStyle(
                        fontSize: 20.0,
                        
                      ), ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
