
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/helpers/dependencies.dart';
import 'package:transmobile/view/home%20screen/Client/ClientMainScreens.dart';
import 'package:transmobile/view/home%20screen/Client/search%20Pages/search.dart';
import 'package:transmobile/view/home%20screen/trans/TransHomeScreen.dart';
import 'package:transmobile/view/splashscreens/SplachScreen.dart';

import 'package:transmobile/view/utils/shared.dart';

void main() async{
  
  runApp(const TransMobile());
   dependency.init();
 
  
}

class TransMobile extends StatefulWidget {
  const TransMobile({super.key});

  @override
  State<TransMobile> createState() => _TransMobileState();
}

class _TransMobileState extends State<TransMobile> {
  bool? isClient ;
  bool? isTransporteur ; 
  // This widget is the root of your application.
  @override
  void initState() {
 
    super.initState();
     getUserCurrentState();
    
  }

  getUserCurrentState()async{
       await shared.getClient().then(
        (value) {
          if(value==true){
            setState(() {
              isClient=true;
              isTransporteur=false;
              
            });
          }

        });
        await shared.getTransporteur().then((value) {
           if(value==true){
            setState(() {
              isTransporteur=true;
              isClient=false;
            });
          }
        },);
        
        await shared.noCnoT().then((value) {
            if(value==true){
            setState(() {
              isClient=false;
              isTransporteur=false;
            });
          }
        });
    
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        fontFamily: "MadimiOne",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ( isClient== null && isTransporteur==null  )? const Center(child:  CircularProgressIndicator()):(isTransporteur==true)? const TransHomeScreen(): (isClient==true)? const ClientMainScreens(): const SplachScreen()   ,
    );
  }
}
