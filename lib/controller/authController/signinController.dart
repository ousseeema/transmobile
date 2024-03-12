import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signinController extends GetxController {
  String email = "";
  String password = "";
  bool  isClient = false;
  bool isTrans =false;

void signin(){

// ! sending request to serveur  to signin thje user 


}
  void verificationinput() {
    if (email.isEmpty || !email.isEmail) {
                              Get.snackbar("Error", "Email invalid ",
                                  colorText: Colors.white,
                                  backgroundColor: Colors.red);
                            }
    
    else if (password.isEmpty ||
         password.length < 8 ||
         password.contains(RegExp(r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
           Get.snackbar(
          "Error", "Password must be at least 8 characters ",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    else{
           signin();

            Get.snackbar(
            "Success", "Sign in successfully",
            colorText: Colors.white, backgroundColor: Colors.green);
   

    }
  }
}
