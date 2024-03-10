import 'package:get/get.dart';
import 'package:transmobile/controller/authController/resetpassController.dart';
import 'package:transmobile/controller/authController/signinController.dart';
import 'package:transmobile/controller/authController/signupController.dart';
import 'package:transmobile/controller/client%20trans%20details/transmoreDetails.dart';
import 'package:transmobile/controller/infoController/informationcontroller.dart';
import 'package:transmobile/repository/transDetailsRepo.dart';

class dependency {


  static void init()async{
    // inject controllers to access in other pages 
    Get.lazyPut(() => InformationController(),fenix: true);
    Get.lazyPut(() => signupController(),fenix: true);
    Get.lazyPut(() => signinController(), fenix: true);
    Get.lazyPut(() => resetpassController(), fenix: true);
    Get.lazyPut(() => transDetaislController());



  // injecting repo,

  Get.put(()=> transDetailsRepo());
  }
}