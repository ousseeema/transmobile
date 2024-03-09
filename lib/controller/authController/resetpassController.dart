import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class resetpassController extends GetxController {
  String email = "";




  void SendVerificationCodeForReset() {
    if (email.isEmpty || !email.isEmail) {
      Get.snackbar("Error", "Email invalid ",
          colorText: Colors.white, backgroundColor: Colors.red);
    } else {
     //! send the verification code to the useremail 
       
    }
  }
}
