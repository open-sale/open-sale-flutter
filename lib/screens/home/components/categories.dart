import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laracommerce/controllers/category_controller.dart';
import 'package:laracommerce/models/category.dart';

import '../../../constants.dart';

// We need satefull widget for our categories

// ignore: use_key_in_widget_constructors
class Categories extends StatefulWidget {
  // const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];
  final CategoryController categoryController = Get.put(CategoryController());
  
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.horizontal,
            // itemCount: categories.length,
            itemCount: categoryController.modelList.length,
            itemBuilder: (context, index) => buildCategory(index),
          ),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categoryController.modelList[index].name.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: kDefaultPaddin / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
