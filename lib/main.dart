
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:transmobile/helpers/dependencies.dart';
import 'package:transmobile/view/splashscreens/SplachScreen.dart';
import 'package:transmobile/view/utils/shared.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  
 OneSignal.initialize("5176e766-14cd-4237-a7ee-23274f8d56ed");
 OneSignal.Notifications.requestPermission(true);


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
shared.setplayerId(OneSignal.User.pushSubscription.id??"");
 OneSignal.User.pushSubscription.addObserver((state) {
     
     
      shared.setplayerId(OneSignal.User.pushSubscription.id??"");
    
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
