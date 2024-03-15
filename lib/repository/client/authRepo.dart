// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/view/utils/appConstant.dart';

class authClientRepo extends GetxService{


   

 //! signup 1 client
 Future<Response> signup1Client(data ){
    
    return  UserApi().postRequest(data,AppConstant.signup1Client );
   }

 //! signup 2 client
   Future<Response> signup2Client(data){
    return UserApi().postRequest(data,AppConstant.signup2Client);
   }
  //! resend verification code 
   Future<Response> ResendVerificationCodeClient(data){
    return UserApi().postRequest(data,AppConstant.resendverificationcodeClient);
   }
   // ! signin client 
   Future<Response> SignInClient(data){
    return UserApi().postRequest(data,AppConstant.loginUser);
   }
 

 //! send reset code to the client email
  Future<Response> sendResetCode(data){
    return UserApi().postRequest(data,AppConstant.forgotpasswordClient);
   }


// ! reset password of the client 
 Future<Response> resetPassword(data){
    return UserApi().putRequest(data,AppConstant.resetpasswordClient);
   }






}