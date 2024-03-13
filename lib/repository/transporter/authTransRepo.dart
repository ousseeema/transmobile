import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/view/utils/appConstant.dart';

class authTrasnRepo extends GetxService{

    // !signup1 for transporter 
   Future<Response> signup1Trans(data, ){
    
    return  UserApi().postRequest(data,AppConstant.signup1Trans );
   }


}