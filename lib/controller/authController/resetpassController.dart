import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class resetpassController extends GetxController {
  String email = "";
  String password = "";
  String repassword = "";
 bool onediting_verification_code =true;
 String verification_code ="";

 //! send veification code for the first time 
  void SendresetCode() {
    if (email.isEmpty || !email.isEmail) {
      Get.snackbar("Error", "Email invalid ",
          colorText: Colors.white, backgroundColor: Colors.red);
    } else {
     //! send the verification code to the useremail 
       
    }
  }




 //! resend verification code to the useremail 
  void resendresetcode(){
   // resend verification code to the useremail 
    



  }



 // send the new password and the code to the serveur to check and update 
    void resetpassword(){
     
     if(verification_code.isEmpty){
      Get.snackbar("Error",
          "Please enter your code",
          colorText: Colors.white, backgroundColor: Colors.red);
    
     }
    else if (password.isEmpty ||
        password.length < 8 ||
        password.contains(RegExp(r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
      Get.snackbar("Error",
          "Password must be at least 8 characters long",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
   else if ( !( repassword == password)) {
      Get.snackbar("Error", "Password must the same",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    else{


    }
    


    }      


}
