import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/authController/signinController.dart';
import 'package:transmobile/controller/client%20trans%20details/clientmoreDetails.dart';
import 'package:transmobile/controller/client%20trans%20details/transmoreDetails.dart';

class signupController extends GetxController {
  String  name="" ;
  String email = "";
  String password = "";
  String repassword = "";
  String verificationCode = "";
  bool verificationstatus = false;
  bool onediting_verification_code = true;

  void inputVerification() {
       name =Get.find<signinController>().isClient?Get.find<ClientDetailsController>().fullname :Get.find<transDetaislController>().fullname ;
       email = Get.find<signinController>().isClient?Get.find<ClientDetailsController>().email :Get.find<transDetaislController>().email ;
      password = Get.find<signinController>().isClient?Get.find<ClientDetailsController>().password :Get.find<transDetaislController>().password ;
      repassword =Get.find<signinController>().isClient?Get.find<ClientDetailsController>().repassword :Get.find<transDetaislController>().repassword ;
    if (name.isEmpty || name.length < 3 || name.contains(RegExp(r'[0-9]'))) {
      Get.snackbar("Error", "Please enter your name",
          colorText: Colors.white, backgroundColor: Colors.red);
      verificationstatus = false;
    } else if (email.isEmpty || !email.isEmail) {
      Get.snackbar("Error", "Please enter a valid email address",
          colorText: Colors.white, backgroundColor: Colors.red);
      verificationstatus = false;
    } else if (password.isEmpty ||
        password.length < 8 ||
        password.contains(RegExp(r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
      Get.snackbar("Error", "Password must be at least 8 characters long",
          colorText: Colors.white, backgroundColor: Colors.red);
      verificationstatus = false;
    } else if (!(repassword == password)) {
      Get.snackbar("Error", "Password's must the same",
          colorText: Colors.white, backgroundColor: Colors.red);
      verificationstatus = false;
    } else {
     
      verificationstatus = true;
      Get.snackbar("Success", "One more step and we're done",
          colorText: Colors.white, backgroundColor: Colors.green);
    }
  }

  void sendverification_code() {
    //! this function is the responsble for sending the verification code
    //! to complete the processs of the signup

    if (verificationCode.isEmpty) {
      Get.snackbar("Error", "Please enter your code ",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}
