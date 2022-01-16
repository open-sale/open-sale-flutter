import 'package:flutter/material.dart';
import '/models/product.dart';

import '/constants.dart';

class ItemCard extends StatelessWidget {
  // final Product product;
  String id;
  String name;
  // String description;
  String image;
  String price;
  // String size;
  String color;
  // String category;

  final VoidCallback press;
  ItemCard({
    Key? key,
    // required this.product,
    required this.id,
    required this.name,
    // required this.description,
    required this.image,
    required this.price,
    // required this.size,
    required this.color,
    // required this.category,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                color: Color(int.parse("0xff$color")),
                // color: Color(0xFFD3A984),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: id,
                child: Image.network(image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              name,
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$$price",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
