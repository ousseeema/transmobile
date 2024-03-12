import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/view/utils/appConstant.dart';

class authClientRepo extends GetxService{


   Future<Response> signup1Trans(data){
    
    return  UserApi().postRequest(AppConstant.signup1Trans, data);
   }






}