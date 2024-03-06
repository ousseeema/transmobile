import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/view/SplachScreen.dart';

void main() {
  runApp(const TransMobile());
}

class TransMobile extends StatelessWidget {
  const TransMobile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const SplachScreen(),
    );
  }
}
