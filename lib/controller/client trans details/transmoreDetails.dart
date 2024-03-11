

// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class transDetaislController extends GetxController{
 
 File? selectedImage ;
  String phone_Numeber1 ="";
  String phone_Numeber2="" ;
  String Localaddress = "France";
  String destination = "Tunisie";
  bool home_pickups =false;
  bool home_delivery = false;
 bool response_success = true;
  List<String> Localcountries = [
    "Britain",
    "France",
    "Ireland",
    "Austria",
    "Germany",
    "Italy",
    "Switzerland",
    "Spain",
    "Netherlands",
    "Portugal"
  ];

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



 // verification full address 
 //! 1 verification de linput format et de les deux premier parties le rue et le code postal ...
 bool verifierFormat(String adresse) {
  List<String> composants = adresse.split(",");

  if (composants.length != 3) {
    return false;
  }

  String rueEtNumero = composants[0];
  String codePostalEtVille = composants[1];
 

  if (!rueEtNumero.contains("Rue")) {
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
  String pays = composants[2].trim();

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
   
  // ! this the function that will be called from the trans detaisl ui 
   void check_before_send(){
   
    if(selectedImage == null){
    Get.snackbar("Error", "Ops! Please select a profile image", colorText: Colors.white, backgroundColor: Colors.red);

    }
    else if(!check_Number()){
    Get.snackbar("Error", "Ops! Missing phone number ", colorText: Colors.white, backgroundColor: Colors.red);

    }
    else if(!verification_full_address(Localaddress, Localcountries)){
       Get.snackbar("Error", "Ops! Your address is bad formatted \n or your countrie is not listed ", colorText: Colors.white, backgroundColor: Colors.red);

    }
    else {
      // send the detaisln to serveur to update the details 
      //  ! and if the respons status is sccess update response_success and go to the next page
      response_success = true;

  
    }
    
    
      

  
   }
















   }








