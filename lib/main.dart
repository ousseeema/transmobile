
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
 


  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
   OneSignal.shared.setAppId("your-onesignal-app-id");
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

  // Get the player ID
  OneSignal.shared.getDeviceState().then((deviceState) async{
    if (deviceState != null) {
      String? playerId = deviceState.userId;
    
      SharedPreferences shared = await  SharedPreferences.getInstance();
      shared.setString("pushNotifId", playerId!);
    }
    
  });
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
