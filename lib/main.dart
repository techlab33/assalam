import 'package:assalam/screens/bottom_nav_bar_page/bottom_nav_bar.dart';
import 'package:assalam/utils/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application widgets for.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.appThemes,
      home: const BottomNaveBarPage(),
    );

  }
}
