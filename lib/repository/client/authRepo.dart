import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/view/utils/appConstant.dart';

class authClientRepo extends GetxService{


   

 Future<Response> signup1Client(data, ){
    
    return  UserApi().postRequest(data,AppConstant.signup1Trans );
   }





}