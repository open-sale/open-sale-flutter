import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laracommerce/controllers/product_controller.dart';
import '/constants.dart';
import '/screens/details/details_screen.dart';
import 'categories.dart';
import 'item_card.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin, vertical: kDefaultPaddin/2),
          child: Text(
            "OPEN SALE",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Obx(
              () => SafeArea(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.8,
                  padding: const EdgeInsets.all(5),
                  children: productController.modelList.map(
                    (item) {
                      return ItemCard(
                        id: item.id.toString(),
                        name: item.name,
                        color: item.color,
                        image: item.image,
                        price: item.price,
                        press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: item,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(), // Don't forget to add this parser, as we are working with Iterable but a list of widgets is expected
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
