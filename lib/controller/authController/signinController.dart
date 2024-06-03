// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transmobile/repository/client/authRepo.dart';
import 'package:transmobile/repository/transporter/authTransRepo.dart';
import 'package:transmobile/view/home%20screen/Client/ClientMainScreens.dart';
import 'package:transmobile/view/home%20screen/trans/TransMainScreen.dart';

class signinController extends GetxController {
  String email = "";
  String password = "";
  bool isClient = false;
  bool isTrans = false;
  bool is_Loading = false;
  SharedPreferences shared = Get.find();
   
  void signin() async {
    is_Loading = true;
    update();
    Map<String, dynamic> data = {"email": email, "password": password};

    Response response;
    String DataToSend = jsonEncode(data);


      if (isClient) {
    try {
        response = await authClientRepo().SignInClient(DataToSend);
      if (response.body["success"] == true) {


        // enregistre le client object in a string in the sharedpreferences
        await shared.setString(
            "user", jsonEncode(response.body["data"]));
        // enregistre el token fi sharedpreferences
        await shared.setString("token",jsonEncode(response.body["token"]));
         await shared.setBool("isLogged",true);
                  // setting is transporteur to false  and client for true 
         await shared.setBool("client", true);
         await shared.setBool("transporteur", false);
        

        Get.snackbar("Success", "Sign up successfully",
            colorText: Colors.white, backgroundColor: Colors.green);
        Get.offAll(() => const ClientMainScreens());
        Future.delayed(const Duration(seconds: 1), () {
          is_Loading = false;
        });
        update();
      } else {
        is_Loading = false;
        update();

        Get.snackbar("Error", response.body["message"],
            colorText: Colors.white, backgroundColor: Colors.red);
      }

      
    } catch (e) {
       is_Loading = false;
        update();
       
      Get.snackbar("Error","serveur error",
            colorText: Colors.white, backgroundColor: Colors.red);
    }



    } else {
      try {
        response = await authTrasnRepo().SignInTrans(DataToSend);
      if (response.body["success"] == true) {
       print(response.body["token"]);

        // enregistre le client object in a string in the sharedpreferences
        await shared.setString(
            "user", jsonEncode(response.body["data"]));
        // enregistre el token fi sharedpreferences
        await shared.setString("token", jsonEncode(response.body["token"]));
         await shared.setBool("isLogged",true);
         // setting is transporteur to true and client for false 
         await shared.setBool("transporteur", true);
                  await shared.setBool("client", false);


        Get.snackbar("Success", "Sign up successfully",
            colorText: Colors.white, backgroundColor: Colors.green);
        Get.offAll(() => const TransHomeScreen());
        Future.delayed(const Duration(seconds: 1), () {
          is_Loading = false;
        });
        update();
      } else {
        is_Loading = false;
        update();
        Get.snackbar("Error", response.body["message"],
            colorText: Colors.white, backgroundColor: Colors.red);
      }
      } catch (e) {
         is_Loading = false;
        update();
         Get.snackbar("Error", "Server error",
            colorText: Colors.white, backgroundColor: Colors.red);
        
      }
    }
  }

  void verificationinput() {
    if (email.isEmpty || !email.isEmail) {
      Get.snackbar("Error", "Email invalid ",
          colorText: Colors.white, backgroundColor: Colors.red);
    } else if (password.isEmpty ||
        password.length < 8 ||
        password.contains(RegExp(r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
      Get.snackbar("Error", "Password must be at least 8 characters ",
          colorText: Colors.white, backgroundColor: Colors.red);
    } else {
      signin();

      
    }
  }
}
