import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/build_app_bar.dart';
import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
    );
  }
}
