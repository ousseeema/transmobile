// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class ClientDetailsController extends GetxController{


 File? selectedImage ;
  String  fullname="" ;
  String email = "";
  String password = "";
  String repassword = "";
  String phone_Numeber1 ="";
  String phone_Numeber2="" ;
  String address = "";
  String currentCountry="";
  bool is_Loading = false;
  bool success_signup1 =false;

 void signupClient()async {
     
      
      Map<String,dynamic> userdetails ={
      "fullName": fullname,
      "email": email,
      "password": password,
      "Phone_Number":phone_Numeber1,
      "Phone_Number2":phone_Numeber2,
      "country":currentCountry,
      "fulladdress":address,
      };

      String userdetailsdecoded = json.encode(userdetails);
      FormData(
        {
          "file":MultipartFile( selectedImage!.readAsBytesSync() , filename: "image"),
          "data":userdetailsdecoded,
        }
      );
      is_Loading= true;
      update();
     // Response response = await update yuser ()









    
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
  String pays = composants[2].trim().toLowerCase();

  return paysAutorises.contains(pays);
} 
//! this is the main function 
 bool verification_full_address(){
  List<String> countries = [
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
    "libya",
    "algeria",
    "morocoo"
  ];

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
    else if( !verification_full_address()){
       Get.snackbar("Error", "Ops! Your address is bad formatted \n or your countrie is not listed ", colorText: Colors.white, backgroundColor: Colors.red);

    }

    else if(currentCountry.isEmpty){
     Get.snackbar("Error", "Ops! select your current country Please ", colorText: Colors.white, backgroundColor: Colors.red);

    }
    else {
      // send the detaisln to serveur to update the details 
      //  ! and if the respons status is sccess update response_success and go to the next page
      

  
    }
    
    
      

  
   }








  
}