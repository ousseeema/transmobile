// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transmobile/controller/authController/signinController.dart';
import 'package:transmobile/repository/client/authRepo.dart';
import 'package:transmobile/repository/transporter/authTransRepo.dart';
import 'package:transmobile/view/home%20screen/Client/ClientHomeScreen.dart';
import 'package:transmobile/view/home%20screen/trans/TransHomeScreen.dart';
import 'package:transmobile/view/login%20screens/resetpassword.dart';

class resetpassController extends GetxController {
  String email = "";
  String password = "";
  String repassword = "";
  bool is_Loading1 = false;
  bool onediting_Reset_code = true;
  String Reset_code = "";
  bool resent_Loading = false;
  bool reset_Loading = false;
  bool user = Get.find<signinController>().isClient;
  SharedPreferences shared = Get.find();

  //! send veification code for the first time
  // ! i used this function twice one for sending the first reset code
  //! and the second when the user want to resend the reset code
  void SendresetCode() async {
    if (email.isEmpty || !email.trim().isEmail) {
      Get.snackbar("Error", "Email invalid ",
          colorText: Colors.white, backgroundColor: Colors.red);
    } else {
      //! send the verification code to the useremail
      is_Loading1 = true;
      update();

      Map<String, dynamic> data = {"email": email};
      String DataToSend = jsonEncode(data);
      Response response;

      if (user) {
        //! ken how user besh naabaath requet fiha el emaile li dakhla besh yaabathli reset code aala email heka
        response = await authClientRepo().sendResetCode(DataToSend);
        if (response.body["success"] == true) {
          Get.snackbar("Success", response.body["message"],
              colorText: Colors.white, backgroundColor: Colors.green);

          Future.delayed(const Duration(seconds: 1), () {
            is_Loading1 = false;
            update();
          });
          Get.to(() => const resetpassword());
        } else {
          is_Loading1 = false;
          update();

          Get.snackbar("Error", response.body["message"],
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      } else {
        //!ken how transporteur nbaaathla request fiha email besh ybaathli reset code
        response = await authTrasnRepo().sendResetCode(DataToSend);

        if (response.body["success"] == true) {
          Get.snackbar("Success", response.body["message"],
              colorText: Colors.white, backgroundColor: Colors.green);
          Get.to(() => const resetpassword());
          Future.delayed(const Duration(seconds: 1), () {
            is_Loading1 = false;
          });
          update();
        } else {
          is_Loading1 = false;
          update();

          Get.snackbar("Error", response.body["message"],
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      }
    }
  }

  // resending the reset code to the user email
  void resendResetCode() async {
    if (email.isEmpty || !email.trim().isEmail) {
      Get.snackbar("Error", "Email invalid ",
          colorText: Colors.white, backgroundColor: Colors.red);
    } else {
      bool user = Get.find<signinController>().isClient;
      //! send the verification code to the useremail
      resent_Loading = true;
      update();

      Map<String, dynamic> data = {"email": email};
      String DataToSend = jsonEncode(data);
      Response response;

      if (user) {
        //! ken how user besh naabaath requet fiha el emaile li dakhla besh yaabathli reset code aala email heka
        response = await authClientRepo().sendResetCode(DataToSend);
        if (response.body["success"] == true) {
          Get.snackbar("Success", response.body["message"],
              colorText: Colors.white, backgroundColor: Colors.green);

          resent_Loading = false;
          update();
        } else {
          resent_Loading = false;
          update();

          Get.snackbar("Error", response.body["message"],
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      } else {
        //!ken how transporteur nbaaathla request fiha email besh ybaathli reset code
        response = await authTrasnRepo().sendResetCode(DataToSend);

        if (response.body["success"] == true) {
          Get.snackbar("Success", response.body["message"],
              colorText: Colors.white, backgroundColor: Colors.green);
          resent_Loading = false;
          update();
        } else {
          resent_Loading = false;
          update();

          Get.snackbar("Error", response.body["message"],
              colorText: Colors.white, backgroundColor: Colors.red);
        }
      }
    }
  }

  void Reset_The_Password() async {
    reset_Loading = true;
    update();

    Map<String, dynamic> data = {
      "resetToken": Reset_code,
      "password": password,
    };
         // convert the data to a json string 
    String DataToSend = jsonEncode(data);

    Response response;

    //! if the user is client then do
    if (user) {
      response = await authClientRepo().resetPassword(DataToSend);

      if (response.body["success"] == true) {
        // enregistre le client object in a string in the sharedpreferences
        await shared.setString("client", jsonEncode(response.body["data"]));
        // enregistre el token fi sharedpreferences
        await shared.setString("token", jsonEncode(response.body["token"]));
        print(await shared.getString("token"));
        // afficche un snack bar de succes et move to the next page
        Get.snackbar("Success", "Reset password  successfully",
            colorText: Colors.white, backgroundColor: Colors.green);
        Get.offAll(() => const ClienHomeScreen());
        Future.delayed(const Duration(seconds: 1), () {
          reset_Loading = false;
          update();
        });
      } else {
        reset_Loading = false;
        update();

        Get.snackbar("Error", response.body["message"],
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }
     //! if the user is transporteur 
    else{
       response = await authTrasnRepo().resetPassword(DataToSend);
       // ! if  the respoonse is true then create a  &transporter object to access every where after 
                
      if (response.body["success"] == true) {
         
            // enregistre le client object in a string in the sharedpreferences 
              await  shared.setString("transporter", jsonEncode(response.body["data"]));
            // enregistre el token fi sharedpreferences 
           await  shared.setString("token", jsonEncode(response.body["token"]));
      
                 print(await shared.getString("token"));

        Get.snackbar("Success","Reset password  successfully",
            colorText: Colors.white, backgroundColor: Colors.green);
        Get.offAll(() => const TransHomeScreen());
        Future.delayed(const Duration(seconds: 1), () {
          reset_Loading = false;
            update();
        });
      
      } else {
          reset_Loading = false;
          update();

        Get.snackbar("Error", response.body["message"], colorText: Colors.white, backgroundColor: Colors.red);

      }



      
    }




  }

  // send the new password and the code to the serveur to check and update
  void reset_password() {
    if (Reset_code.isEmpty) {
      Get.snackbar("Error", "Please enter your code",
          colorText: Colors.white, backgroundColor: Colors.red);
    } else if (password.isEmpty ||
        password.length < 8 ||
        password.contains(RegExp(r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
      Get.snackbar("Error", "Password must be at least 8 characters long",
          colorText: Colors.white, backgroundColor: Colors.red);
    } else if (!(repassword == password)) {
      Get.snackbar("Error", "Password must the same",
          colorText: Colors.white, backgroundColor: Colors.red);
    } else {
      Reset_The_Password();
    }
  }
}
