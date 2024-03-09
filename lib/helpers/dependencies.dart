import 'package:get/get.dart';
import 'package:transmobile/controller/authController/signinController.dart';
import 'package:transmobile/controller/authController/signupController.dart';
import 'package:transmobile/controller/infoController/informationcontroller.dart';

class dependency {


  static void init()async{
    // inject controllers to access in other pages 
    Get.lazyPut(() => InformationController(),fenix: true);
    Get.lazyPut(() => signupController(),fenix: true);
    Get.lazyPut(() => signinController(), fenix: true);



  }
}