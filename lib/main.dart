import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laracommerce/screens/home/home_screen.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Sale',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      // home: HomeScreen(),
      // init route
      initialRoute: '/HomeScreen',
      // Instead of the classic 'routes' we use the GetX routing management,
      // avoiding the context parameter as mentioned above
      getPages: [
           GetPage(name: '/HomeScreen', page: () => const HomeScreen()),
      ],
    );
  }
}
