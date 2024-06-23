
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:transmobile/helpers/dependencies.dart';
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

  @override
  void initState() {
 
    super.initState();
     initOneSignal();
    
  }
void initOneSignal() {
 OneSignal.initialize("5176e766-14cd-4237-a7ee-23274f8d56ed");
 OneSignal.LiveActivities.setupDefault();
 OneSignal.User.pushSubscription.addObserver((state) {
      print(OneSignal.User.pushSubscription.optedIn);
      print("dklauzjdgazkdagzdazdgazdgazdazdazd${OneSignal.User.pushSubscription.id}");
    shared.setplayerId(OneSignal.User.pushSubscription.id??"");
      print(OneSignal.User.pushSubscription.token);
      print(state.current.jsonRepresentation());
    });
     OneSignal.LiveActivities.setupDefault();
}
  
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        fontFamily: "MadimiOne",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     
     home: const SplachScreen()
    );
  }
}
