// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/view/utils/appConstant.dart';

class authTrasnRepo extends GetxService{

    // !signup1 for transporter 
   Future<Response> signup1Trans(data ){
    
    return  UserApi().postRequest(data,AppConstant.signup1Trans );
   }

     //! signup2 for transporter
    Future<Response> signup2Trans(data ){
    
    return  UserApi().postRequest(data,AppConstant.signup2Trans );
   }
   // ! resend verification code for transporter
   Future<Response> ResendVerificationCodeTrans(data){
    return UserApi().postRequest(data,AppConstant.resendverificationcodeTrans);
   }
   //! signin for transporter
   Future<Response> SignInTrans(data){
    return UserApi().postRequest(data,AppConstant.loginTrans);
   }
   //! send reset code to the transporter email
  Future<Response> sendResetCode(data){
    return UserApi().postRequest(data,AppConstant.forgotpasswordTrans);
   }


// ! reset password of the transporter 
 Future<Response> resetPassword(data){
    return UserApi().postRequest(data,AppConstant.resetpasswordTrans);
   }

}