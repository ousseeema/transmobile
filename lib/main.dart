import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/helpers/dependencies.dart';
import 'package:transmobile/view/More%20details%20C/T/ClientDetails.dart';
import 'package:transmobile/view/More%20details%20C/T/transDetails.dart';
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
      /* supportedLocales: const [
           Locale("fr"),
            Locale("uk"),
             Locale("gb"),
             Locale("ie"),
             Locale("es"),
             Locale("at"),
             Locale("de"),
             Locale("de"),
       ],
          localizationsDelegates: const [
        CountryLocalizations.delegate,
        
      ],*/
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        fontFamily: "MadimiOne",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const TransDetails(),
    );
  }
}
