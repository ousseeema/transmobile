import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/helpers/dependencies.dart';
import 'package:transmobile/view/home%20screen/Client/ClientMainScreens.dart';
import 'package:transmobile/view/splashscreens/SplachScreen.dart';

void main() async{
  
  runApp(const TransMobile());
   dependency.init();
}

class TransMobile extends StatelessWidget {
  const TransMobile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        fontFamily: "MadimiOne",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const ClientMainScreens(),
    );
  }
}
