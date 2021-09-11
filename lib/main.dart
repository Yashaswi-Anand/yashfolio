import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yashfolio/Screens/mobileMainScreen.dart';
import 'Screens/collapsingNavBarDestop.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'defaultScreen/defaultScreens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VxDevice(mobile: MobileMainScreen(), web: CollapsingNavbarDestop(),)
    );
  }
}

