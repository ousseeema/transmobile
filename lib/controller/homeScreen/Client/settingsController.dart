// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/shared.dart';

class SettingController extends GetxController {
  bool NightMode = false;
  ClientModel? client;
  bool isloading = true;
  TransporterModel? transporteur;
  GetUserInfo() async {
    if (await shared.getClient() == true) {
      await shared.getuser().then((value) {
        client = ClientModel.fromJson(jsonDecode(value!));
      });
      isloading = false;
      update();
    } else if (await shared.getTransporteur() == true) {
      await shared.getuser().then((value) {
        transporteur = TransporterModel.fromJson(jsonDecode(value!));
      });
      isloading = false;
      update();
    }
  }

  void NigthModeChange(bool value) {
    NightMode = value;
    update();
  }

  // edit page variable and functions

  File? selectedImage;
  String newfullname = "";
  String newaddress = "";
  String newphonenumber1 = "";
  String newphonenumber2 = "";
  String newcountry = "";
  bool edit_loading = false;
  SharedPreferences SHARED = Get.find();
  Future PickimageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      update();
      return;
    }

    selectedImage = File(image.path);
    update();
  }

// update user details like name and address and country , phone number 1 et 2, pdp

  void EditProfile() async {
    edit_loading = true;
    update();
    Map<String, dynamic> data = {};

    // if the data are all good the add the modified one to the json object to send to the server
    if (validateInput() == true) {
      // testing if  user
      if (newfullname.length >= 4) {
        data['fullName'] = newfullname;
      }
      if (newaddress.length >= 10) {
        data['fulladdress'] = newaddress;
      }
      if (newphonenumber1.length >= 6) {
        data['Phone_Number'] = newphonenumber1;
      }
      if (newphonenumber2.length >= 6) {
        data['Phone_Number2'] = newphonenumber2;
      }
      if (newcountry.isNotEmpty) {
        data['country'] = newcountry;
      }
      // testing if the image is not updated then send only json data else send the data + the new image
      FormData datatosend;
      if (selectedImage != null) {
        String requestData = json.encode(data);
        datatosend = FormData({
          "data": requestData,
          "file": MultipartFile(selectedImage!.readAsBytesSync(),
              filename: 'image.jpg')
        });
      } else {
        String requestData = json.encode(data);
        datatosend = FormData({
          "data": requestData,
        });
      }

      // send the data to the server to modified the user details

      Response updateUserDetails = await Get.find<UserApi>()
          .putRequest(datatosend, AppConstant.updatesuser);
      if (updateUserDetails.body["success"] == true) {
        await SHARED.setString(
            "user", jsonEncode(updateUserDetails.body["data"]));
        // seeting everything to the beginning status
        newfullname = "";
        newaddress = "";
        newphonenumber1 = "";
        newphonenumber2 = "";
        newcountry = "";

        edit_loading = false;
        update();
        Get.back();
        Get.snackbar("Success", "Your account has been updated successfuly",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Get.snackbar("Error", "Error while updating your details",
            backgroundColor: Colors.red, colorText: Colors.white);
        edit_loading = false;
        update();
      }
    } else {
      // to rset the edit_loading i case the input is not correct
      edit_loading = false;
      update();
    }
  }

  bool validateInput() {
    // if all the champ are empty and the user tap the button show error message
    if (newfullname.isEmpty &&
        newaddress.isEmpty &&
        newphonenumber1.isEmpty &&
        newphonenumber2.isEmpty &&
        newcountry.isEmpty &&
        selectedImage == null) {
      Get.snackbar("Error", "Please update at least one ",
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    // if some of  the champ are not good and the user tap the button show error message
    else if ((newfullname.isNotEmpty && newfullname.length < 4) ||
        (newaddress.isNotEmpty && newaddress.length < 10) ||
        (newphonenumber1.isNotEmpty && newphonenumber1.length < 6) ||
        (newphonenumber2.isNotEmpty && newphonenumber2.length < 6)) {
      Get.snackbar("Error", "Please update at least one mandatory field",
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    } else {
      return true;
    }
  }

  // change  email  functions and variables
  bool resetEmail_loading = false;
  String changedemail = "";

  void changeEmailAddress() async {
    resetEmail_loading = true;
    update();

    if (changedemail == "" || !changedemail.isEmail) {
      Get.snackbar("Error", "Please enter your new valid email address",
          backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      String data = jsonEncode({"email": changedemail});

      Response changeEmailResponse = await Get.find<UserApi>()
          .putRequest(AppConstant.changeuseremail, data);

      if (changeEmailResponse.body["success"] == true) {
        //
        await SHARED.setString(
            "user", jsonEncode(changeEmailResponse.body["data"]));
        changedemail = "";
        resetEmail_loading = false;
        update();
        Get.snackbar("Success", "Your email has been updated successfuly",
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.back();
      } else {
        resetEmail_loading = false;
        update();
        Get.snackbar("Error", changeEmailResponse.body["message"],
            backgroundColor: Colors.green, colorText: Colors.white);
      }
    }
  }

  // change password functionality and variables
  bool changepassword_loading = false;
  String oldpassword = "";
  String newpassword = "";

  void changepassword() async {
    changepassword_loading = true;
    update();

    // ! first check the passwords fields
    if (oldpassword.isEmpty ||
        oldpassword.length < 8 ||
        oldpassword.contains(RegExp(r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
      Get.snackbar("Error", "Please enter your old password correctly",
          backgroundColor: Colors.red, colorText: Colors.white);
    } else if (newpassword.isEmpty ||
        newpassword.length < 8 ||
        newpassword.contains(RegExp(r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
      Get.snackbar("Error", "your new password must be atleast 8 caractere",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    //! then send the new and old password to the server to update the password
    else {
      // encoding object to json string besh yefhmha server
      String data = jsonEncode({
        {"oldpassword": oldpassword, "newpassword": newpassword}
      });

      Response updatedpassword = await Get.find<UserApi>()
          .putRequest(data, AppConstant.changeuserpassword);

      if (updatedpassword.body["success"] == true) {
        oldpassword = "";
        newpassword = "";
        changepassword_loading = false;
        update();
        Get.snackbar("Success", "Your email has been updated successfuly",
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.back();
      } else {
         changepassword_loading = false;
        update();
        Get.snackbar("Error", updatedpassword.body["message"],
            backgroundColor: Colors.green, colorText: Colors.white);
      }
    }
  }
}
