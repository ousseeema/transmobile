import 'package:flutter/material.dart';
import 'package:get/get.dart';


class signupController extends GetxController {
  String name="";
  String email="";
  String password="";
  String repassword="";
  String verificationCode="";
  bool onediting_verification_code =true ;
 void _signup(){
    // sending request to the serveur to sign up the current user 
     //! if the response is SUCCESS then move to the  verification code page 

  
 }

  void inputVerification() {
    if (  name.isEmpty || name.length < 3 || name.contains(RegExp(r'[0-9]'))) {
      Get.snackbar("Error", "Please enter your name",
          colorText: Colors.white, backgroundColor: Colors.red);
    }

   else if ( email.isEmpty || !email.isEmail) {
      Get.snackbar("Error", "Please enter a valid email address",
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

    else {
        _signup();
      Get.snackbar("Success", "logged successfuly",
       colorText: Colors.white, backgroundColor: Colors.green );
    }
    
     


  }


 void sendverification_code(){
  //! this function is the responsble for sending the verification code
  //! to complete the processs of the signup
  

    if(verificationCode.isEmpty){
       Get.snackbar("Error", "Please enter your code ",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
 }
}
