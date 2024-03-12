import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/controller/authController/resetpassController.dart';
import 'package:transmobile/controller/authController/signinController.dart';
import 'package:transmobile/controller/authController/signupController.dart';
import 'package:transmobile/controller/client%20trans%20details/clientmoreDetails.dart';
import 'package:transmobile/controller/client%20trans%20details/transmoreDetails.dart';
import 'package:transmobile/controller/infoController/informationcontroller.dart';
import 'package:transmobile/repository/client/authRepo.dart';
import 'package:transmobile/repository/transporter/authTransRepo.dart';

class dependency {


  static void init()async{
    // inject controllers to access in other pages 
    Get.lazyPut(() => InformationController(),fenix: true);
    Get.lazyPut(() => signupController(),fenix: true);
    Get.lazyPut(() => signinController(), fenix: true);
    Get.lazyPut(() => resetpassController(), fenix: true);
    Get.lazyPut(() => transDetaislController(), fenix: true);
    Get.lazyPut(() => ClientDetailsController(), fenix: true);



  // injecting repo,
  //apiRepository: 
  Get.lazyPut(() => UserApi());
  //client:
 
   Get.lazyPut(() => authClientRepo());

//transporter:
 Get.lazyPut(() => authTrasnRepo());
  }
}