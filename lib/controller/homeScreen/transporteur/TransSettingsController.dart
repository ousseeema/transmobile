import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/historypage.dart';
import 'package:transmobile/view/splashscreens/transOuclient.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/shared.dart';

import '../../../model/client/ClientModel.dart';
import '../../../model/verification demande/verificationDemandes model.dart';

class TransSettingsController  extends GetxController{




// ignore_for_file: non_constant_identifier_names, unused_local_variable



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
  String newLocalAddress = "";
  String newDestinationAddress = "";
  String newphonenumber1 = "";
  String newphonenumber2 = "";
  String NewLocalCountry = "";
  String NewDestinationCountry="";
  bool edit_loading = false;

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
 bool validateInput() {
    // if all the champ are empty and the user tap the button show error message
    if (newfullname.isEmpty &&
        newLocalAddress.isEmpty &&
        newDestinationAddress.isEmpty &&
        newphonenumber1.isEmpty &&
        newphonenumber2.isEmpty &&
        NewLocalCountry.isEmpty &&
        NewDestinationCountry.isEmpty &&
        selectedImage == null){
      Get.snackbar("Error", "Please update at least one ",
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    }
    // if some of  the champ are not good and the user tap the button show error message
    else if ((newfullname.isNotEmpty && newfullname.length < 4) ||
        (newLocalAddress.isNotEmpty && newLocalAddress.length < 10) ||
        (newDestinationAddress.isNotEmpty && newDestinationAddress.length < 10) ||
        (newphonenumber1.isNotEmpty && (newphonenumber1.length < 6||newphonenumber1.length > 15 )) ||
        (newphonenumber2.isNotEmpty && (newphonenumber2.length < 6 || newphonenumber2.length > 15))) {
      Get.snackbar("Error", "Please check your fields and try again",
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    } else {
      return true;
    }
  }
  void EditProfile() async {
    SharedPreferences SHARED = await SharedPreferences.getInstance();

    Map<String, dynamic> data = {};

    // if the data are all good the add the modified one to the json object to send to the server
    if (validateInput() == true) {
      // testing if  user
      if (newfullname.length >= 4) {
        data['fullName'] = newfullname;
      }
      if (newLocalAddress.length >= 10) {
        data['localAddress'] = newLocalAddress;
      }
       if (newDestinationAddress.isNotEmpty) {
        data['DestinationAddress'] = NewDestinationCountry;
      }
      if (newphonenumber1.length >= 6) {
        data['PhoneNumber_A'] = newphonenumber1;
      }
      if (newphonenumber2.length >= 6) {
        data['PhoneNumber_B'] = newphonenumber2;
      }
      if (NewLocalCountry.isNotEmpty) {
        data['ListCountry_1'] = NewDestinationCountry;
      }
       
        if (NewDestinationCountry.isNotEmpty) {
        data['ListCountry_2'] = NewDestinationCountry;
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

      try {
        // send the data to the server to modified the user details
        edit_loading = true;
        update();
        Response updateUserDetails = await Get.find<UserApi>()
            .putRequest(datatosend, AppConstant.updateTrans);
        if (updateUserDetails.body["success"] == true) {
          selectedImage = null;
          await SHARED.setString(
              "user", jsonEncode(updateUserDetails.body["data"]));
          // seeting everything to the beginning status
          newfullname = "";
          newLocalAddress = "";
           newDestinationAddress="";
          newphonenumber1 = "";
          newphonenumber2 = "";
          NewLocalCountry = "";
          NewDestinationCountry="";
         


          Get.back();
          Get.snackbar("Success", "Your account has been updated successfuly",
              backgroundColor: Colors.green, colorText: Colors.white);
          Future.delayed(Duration.zero, () {
            edit_loading = false;
            update();
          });
        } else {
          print(updateUserDetails.body["message"]);
          Get.snackbar("Error", "Error while updating your details",
              backgroundColor: Colors.red, colorText: Colors.white);
          Future.delayed(Duration.zero, () {
            edit_loading = false;
            update();
          });
        }
      } catch (e) {
        print(e.toString());
        Get.snackbar("Error", "Error while updating your details",
            backgroundColor: Colors.red, colorText: Colors.white);
        Future.delayed(Duration.zero, () {
          edit_loading = false;
          update();
        });
      }
    }
  }

 

  // change  email  functions and variables
  bool resetEmail_loading = false;
  String changedemail = "";

  void changeEmailAddress() async {
    SharedPreferences SHARED = await SharedPreferences.getInstance();

    if (changedemail == "" || !changedemail.isEmail) {
      Get.snackbar("Error", "Please enter your new valid email address",
          backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      resetEmail_loading = true;
      update();
      Map<String, dynamic> data = {"email": changedemail};

      try {
        Response changeEmailResponse = await Get.find<UserApi>()
            .putRequest(data, AppConstant.TranschangeEmail);
            

        if (changeEmailResponse.body["success"] == true) {
          await SHARED.setString(
              "user", jsonEncode(changeEmailResponse.body["data"]));
          Get.back();
          changedemail = "";
          Get.snackbar("Success", "Your email has been updated successfuly",
              backgroundColor: Colors.green, colorText: Colors.white);
          Future.delayed(Duration.zero, () {
            resetEmail_loading = false;
            update();
          });
        } else {
          Future.delayed(Duration.zero, () {
            resetEmail_loading = false;
            update();
          });
          Get.snackbar("Error", changeEmailResponse.body["message"],
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      } catch (e) {
        Future.delayed(Duration.zero, () {
          resetEmail_loading = false;
          update();
        });
        Get.snackbar("Error", "Connection lost , try again later",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  // change password functionality and variables
  bool changepassword_loading = false;
  String oldpassword = "";
  String newpassword = "";
  // ! verification input field
  bool validPass() {
    if (oldpassword.isEmpty ||
        oldpassword.length < 8 ||
        oldpassword.contains(RegExp(r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
      Get.snackbar("Error", "Please enter your old password correctly",
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    } else if (newpassword.isEmpty ||
        newpassword.length < 8 ||
        newpassword.contains(RegExp(r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
      Get.snackbar("Error", "your new password must be atleast 8 caractere",
          backgroundColor: Colors.red, colorText: Colors.white);
      return false;
    } else {
      return true;
    }
  }




  void changepassword() async {
    SharedPreferences SHARED = await SharedPreferences.getInstance();

    // ! first check the passwords fields
    //! then send the new and old password to the server to update the password
    if (validPass() == true) {
      changepassword_loading = true;
      update();
      // encoding object to json string besh yefhmha server
      Map<String, dynamic> data = {
        "oldpassword": oldpassword,
        "newpassword": newpassword
      };

      try {
        Response updatedpassword = await Get.find<UserApi>()
            .putRequest(data, AppConstant.TranschangePassword);

        if (updatedpassword.body["success"] == true) {
          oldpassword = "";
          newpassword = "";

          Get.back();

          Get.snackbar("Success", "Your password has been updated successfuly",
              backgroundColor: Colors.green, colorText: Colors.white);
          Future.delayed(Duration.zero, () {
            changepassword_loading = false;
            update();
          });
        } else {
          Future.delayed(Duration.zero, () {
            changepassword_loading = false;
            update();
          });
          Get.snackbar("Error", updatedpassword.body["message"],
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      } catch (e) {
        Future.delayed(Duration.zero, () {
          changepassword_loading = false;
          update();
        });
        Get.snackbar("Error", "Connection lost try again later",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }







  // go pro functions and variables
  File? passportimage;
  final messageController = TextEditingController();
  bool getverified_Loading = false;
  List<VerificationDemmnades> verifiDemandes = [];

  Future PickimagePassportFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      update();
      return;
    }

    passportimage = File(image.path);
    update();
  }

  // ! sending the passport image and the message to the admin to verifie
  void SendverfRequest() async {
    if (passportimage == null || messageController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all the description",
          backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      // data
      Map<String, dynamic> data = {"message": messageController.text};
      //!data encoded
      String dataencoded = json.encode(data);
      // form data (image + json String)
      FormData datatosend = FormData({
        "data": dataencoded,
        "file": MultipartFile(passportimage!.readAsBytesSync(),
            filename: 'image.jpg')
      });

      try {
        getverified_Loading = true;
        update();
        Response verificationClient = await Get.find<UserApi>()
            .postRequest(datatosend, AppConstant.TransGetverified);

        if (verificationClient.body["success"] == true) {
          passportimage = null;
          messageController.clear();
          Get.back();

          Get.snackbar("Success", verificationClient.body["message"],
              backgroundColor: Colors.green, colorText: Colors.white);

          Future.delayed(Duration.zero, () {
            getverified_Loading = false;
            update();
          });
        } else {
          Get.snackbar("Error", verificationClient.body["message"],
              backgroundColor: Colors.red, colorText: Colors.white);
          Get.back();
          Future.delayed(Duration.zero, () {
            getverified_Loading = false;
            update();
          });
        }
      } catch (e) {
       
        Get.back();
        Get.snackbar("Error", "Connection Lost ,try again later",
            backgroundColor: Colors.red, colorText: Colors.white);
        Future.delayed(Duration.zero, () {
          getverified_Loading = false;
          update();
        });
      }
    }
  }

  //! getting verified demande that user have seb=nt to the admins
  bool demandes_Loader = false;
  void GetverifiedDemandes() async {
    try {
      demandes_Loader = true;
      update();
      Response demandes = await Get.find<UserApi>()
          .GetRequest(AppConstant.TransGetAllverificationDemande);

      if (demandes.body["success"] == true) {
        demandes.body["data"].forEach((demande) =>
            verifiDemandes.add(VerificationDemmnades.fromJson(demande)));
        Get.snackbar("Success", demandes.body["message"],
            backgroundColor: Colors.green, colorText: Colors.white);

        Future.delayed(Duration.zero, () {
          demandes_Loader = false;
          update();
        });
      } else {
        Get.snackbar("Error", demandes.body["message"],
            backgroundColor: Colors.red, colorText: Colors.white);
        Get.back();
        Future.delayed(Duration.zero, () {
          demandes_Loader = false;
          update();
        });
      }
    } catch (e) {
      Get.snackbar("Error", "Lost Connection , try again later",
          backgroundColor: Colors.red, colorText: Colors.white);
      Get.back();
      Future.delayed(Duration.zero, () {
        demandes_Loader = false;
        update();
      });
    }
  }

  //! history page function and variables

  bool historypage_loader = false;
  List<TripModel> TripHistoryList = [];
// get all demande de liv that a user have sent to all transporteurs
  void getAllTrips() async {
    historypage_loader = true;
    update();
     TripHistoryList = [];
//! sent request to the serveur
   
    
        Response AllTripsHis =
          await Get.find<UserApi>().GetRequest(AppConstant.TransgetAllTripInHistory);
         
      if (AllTripsHis.body["success"] == true) {
      
        AllTripsHis.body["data"].forEach((trip) {
          TripHistoryList.add(TripModel.fromJson(trip));
        });
           Get.to(()=>const HistoryPage());
       
        Future.delayed(Duration.zero, () {
          historypage_loader = false;
          update();
        });
       
     
       
      } else {
       
        Future.delayed(Duration.zero, () {
          historypage_loader = false;
          update();
        });
      }
   
    
  }
  
//! selected history to display in the hsitory details page 
   TripModel? SelectedTripHistory;






   //! send message to the admin to contact us
   TextEditingController ContactUsMessageController =  TextEditingController();
  bool ContactUs_loading = false;
// send the message to the admin for reclaimation
   void contactUs()async{
   

    Map<String, dynamic> data = {
      "reclamation": ContactUsMessageController.text
    };
    // ! if the message is empty then display the error message
    if(ContactUsMessageController.text.isEmpty){
Get.snackbar("Success", "Your reclamation must not be empty",
            backgroundColor: Colors.red, colorText: Colors.white);
    }else{
       ContactUs_loading =true ;
    update();
      try {
      String datatoSend= jsonEncode(data);
         // send request to the server
      Response reclamation = await Get.find<UserApi>().postRequest(datatoSend, AppConstant.TransContactAdmin);

      if(reclamation.body["success"] == true){
              // if the request sent successfully the back to the pre page and display
              // success message
               // else errer message 
            Get.back();
            ContactUsMessageController.clear();

       Get.snackbar("Success", reclamation.body["message"],
            backgroundColor: Colors.green, colorText: Colors.white);

        Future.delayed(Duration.zero, () {
           ContactUs_loading= false;
          update();
        });
        
      }
    } catch (e) {
      Get.back();
       Get.snackbar("Success", "error in the server",
            backgroundColor: Colors.red, colorText: Colors.white);

        Future.delayed(Duration.zero, () {
           ContactUs_loading= false;
          update();
        });
      
    }
    }

   }



//! signout func 
//! clear the token and everything
  void signOut(){
    shared().clear();
    Get.offAll(()=> const TransOuClient());
  }


}






  
