// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transmobile/repository/client/authRepo.dart';
import 'package:transmobile/repository/transporter/authTransRepo.dart';
import 'package:transmobile/view/home%20screen/Client/ClientMainScreens.dart';
import 'package:transmobile/view/home%20screen/trans/TransHomeScreen.dart';

class verificationCodeController extends GetxController {
  String verificationCode = "";
  bool onediting_verification_code = true;
  bool is_Loading = false;
  SharedPreferences shared = Get.find();
  bool? isClient;
  bool? istrans;
  String email = "";

  void signup2() async {
    is_Loading = true;
    update();
    Map<String, dynamic> data = {
      "verification_code": verificationCode,
    };
    String dataTosend = jsonEncode(data);

    Response response;

    // ! if its a clien then send to client endpoint else send to the transporter endpooint
    if (isClient!) {
      response = await authClientRepo().signup2Client(dataTosend);

      if (response.body["success"] == true) {
        await shared.setString("user", jsonEncode(response.body["data"]));
        // enregistre el token fi sharedpreferences
        await shared.setString("token", jsonEncode(response.body["token"]));
        await shared.setBool("isLogged", true);
        // setting is transporteur to false  and client for true
        await shared.setBool("client", true);
        await shared.setBool("transporteur", false);

        // afficche un snack bar de succes et move to the next page
        Get.snackbar("Success", "Sign up successfully",
            colorText: Colors.white, backgroundColor: Colors.green);
        Get.offAll(() => const ClientMainScreens());
        Future.delayed(const Duration(seconds: 1), () {
          is_Loading = false;
          update();
        });
      } else {
        is_Loading = false;
        update();

        Get.snackbar("Error", response.body["message"],
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    }

    // if the user is transporter then access this route of function and work
    else {
      response = await authTrasnRepo().signup2Trans(dataTosend);
      // ! if  the respoonse is true then create a  &transporter object to access every where after

      if (response.body["success"] == true) {
        // enregistre le client object in a string in the sharedpreferences
        await shared.setString("user", jsonEncode(response.body["data"]));
        // enregistre el token fi sharedpreferences
        await shared.setString("token", jsonEncode(response.body["token"]));
        await shared.setBool("isLogged", true);
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
    }
  }

  void sendverification_code() {
    //! this function is the responsble for sending the verification code
    //! to complete the processs of the signup

    if (onediting_verification_code == true) {
      Get.snackbar("Error", "Please enter your code ",
          colorText: Colors.white, backgroundColor: Colors.red);
    } else {
      signup2();
    }
  }

  void resending_verification_code() async {
    is_Loading = true;
    update();

    Map<String, dynamic> data = {"email": email};

    // encode the data to a json
    String DataToSend = jsonEncode(data);
    Response response;
    if (isClient!) {
      response =
          await authClientRepo().ResendVerificationCodeClient(DataToSend);

      if (response.body["success"] == true) {
        Get.snackbar("Success", "Code reset successfully,check your email",
            colorText: Colors.white, backgroundColor: Colors.green);

        is_Loading = false;
        update();
      } else {
        Get.snackbar("Success", response.body["message"],
            colorText: Colors.white, backgroundColor: Colors.red);
        is_Loading = false;
        update();
      }
    } else {
      response = await authTrasnRepo().ResendVerificationCodeTrans(DataToSend);

      if (response.body["success"] == true) {
        Get.snackbar("Success", "Code reset successfully,check your email",
            colorText: Colors.white, backgroundColor: Colors.green);

        is_Loading = false;
        update();
      } else {
        Get.snackbar("Success", response.body["message"],
            colorText: Colors.white, backgroundColor: Colors.red);
        is_Loading = false;
        update();
      }
    }
  }
}
