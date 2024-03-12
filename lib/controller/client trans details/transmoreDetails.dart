

// ignore_for_file: non_constant_identifier_names, camel_case_types, unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transmobile/controller/authController/signupController.dart';

class transDetaislController extends GetxController{
 
 File? selectedImage ;
  String phone_Numeber1 ="";
  String phone_Numeber2="" ;
  String Localaddress = "France";
  String destination = "Tunisie";
  String coastkg ="";
  String carPlate ="";
  String carModel ="";
  bool home_pickups =false;
  bool home_delivery = false;
  bool parcels = false;
  String parcelsAddress = "";
  List parcelsSite =[];
 bool response_success = true;
  List<String> Localcountries = [
    "britain",
    "france",
    "ireland",
    "austria",
    "germany",
    "italy",
    "switzerland",
    "spain",
    "netherlands",
    "portugal",
    "tunisie",
    "algeria",
    "marocoo",
    "libya",
    
  ];




  void signupTrans(){
    String email = Get.find<signupController>().email;
    String fullname = Get.find<signupController>().name;
    String password = Get.find<signupController>().password;
    // sending request to the serveur to sign up the current user 
     //! if the response is SUCCESS then move to the  verification code page 

  
 }

Future PickimageFromGallery()async{
   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
     

  if(image == null){
    update();
    return ;
  }
   
     selectedImage = File(image.path);
     update();
   

}
// changing the home pickups and the home delivery and updating the ui 
void homepickups_Change(bool value){
  home_pickups = value;
  update();
}
void homedelivery_Change(bool value){
  home_delivery = value;
  update();
}
void parcels_Change(bool value){
  parcels = value;
  update();
}



 // verification full address 
 //! 1 verification de linput format et de les deux premier parties le rue et le code postal ...
 bool verifierFormat(String adresse) {
  List<String> composants = adresse.split(",");

  if (composants.length != 3) {
    return false;
  }

  String rueEtNumero = composants[0];
  String codePostalEtVille = composants[1];
 

  if (!rueEtNumero.toLowerCase().contains("rue")) {
    return false;
  }

  if (!codePostalEtVille.contains(" ")) {
    return false;
  }

  

  return true;
}
 // ! 2 verification de le pays la 3eme partie de laddress
bool verifierPays(String adresse, List<String> paysAutorises) {
  List<String> composants = adresse.split(",");
  if(composants.length != 3) {
    return false;
  }
  String pays = composants[2].trim().toLowerCase();

  return paysAutorises.contains(pays);
} 
//! this is the main function 
 bool verification_full_address(address, countries){
 

  bool estFormatCorrect = verifierFormat(address);
  bool estPaysAutorise = verifierPays(address, countries);

  if (!estFormatCorrect && !estPaysAutorise) {
    return false;
  }
  return true;
 } 

// verification input number 
  
  bool check_Number(){
    if(phone_Numeber1.length<6){
      return false ;
    }
    else if( phone_Numeber2.length<6 ){
     return false ;
    }
    return true; 
  }
  bool check_Parcels(){
    if((parcels && parcelsSite.isEmpty )||  ( parcels && !verification_full_address(parcelsAddress, Localcountries) )){
      return false;
    }
    return true;
  }
  bool check_plate_and_model(){
    if(carPlate.length<6|| carModel.length<3){
      return false;
    }
    return true;
  }
   
  // ! this the function that will be called from the trans detaisl ui 
   void check_before_send(){
   
    if(selectedImage == null){
    Get.snackbar("Error", "Ops! Please select a profile image", colorText: Colors.white, backgroundColor: Colors.red);

    }
    else if(!check_Number()){
    Get.snackbar("Error", "Ops! Missing phone number ", colorText: Colors.white, backgroundColor: Colors.red);

    }
    else if(!check_plate_and_model()){
          Get.snackbar("Error", "Ops! Missing Car plate or Car model   ", colorText: Colors.white, backgroundColor: Colors.red);

    }
    else if(!verification_full_address(Localaddress, Localcountries)){
       Get.snackbar("Error", "Ops! Your address is bad formatted \n or your countrie is not listed ", colorText: Colors.white, backgroundColor: Colors.red);

    }
    else if(!check_Parcels()){
       Get.snackbar("Error", "Ops! Your address is bad formatted \n or you forgot to choose at least one site ", colorText: Colors.white, backgroundColor: Colors.red);

    }

    else if(coastkg.isEmpty){
     Get.snackbar("Error", "Ops! Please enter the Coast of the single KG ", colorText: Colors.white, backgroundColor: Colors.red);

    }
    
    else {
      // send the detaisln to serveur to update the details 
      //  ! and if the respons status is sccess update response_success and go to the next page
      Get.snackbar("title", "qdfs");
      response_success = true;

  
    }
    
    
      

  
   }
















   }








