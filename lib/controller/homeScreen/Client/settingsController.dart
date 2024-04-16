// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/view/utils/shared.dart';

class SettingController extends GetxController {
  bool NightMode = false;
   ClientModel? client;
   bool isloading =true;
  TransporterModel? transporteur;
   GetUserInfo()async{
   
      if(await shared.getClient()==true ){
         await shared.getuser().then((value) {
        client = ClientModel.fromJson(jsonDecode(value!));
       });
       isloading = false ;
       update();
        
      
      }
      else if(await  shared.getTransporteur()==true){
         await shared.getuser().then((value) {
        transporteur = TransporterModel.fromJson(jsonDecode(value!));
       });
         isloading = false ;
        update();
      }
     
     
  }

  void NigthModeChange(bool value) {
    NightMode = value;
    update();
  }





  // edit page variable and functions 


  File? selectedImage;
  String newfullname ="";
  String newaddress="";
  String newphonenumber1="";
    String newphonenumber2="";
    String newcountry ="";
Future PickimageFromGallery()async{
   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
     

  if(image == null){
    update();
    return ;
  }
   
     selectedImage = File(image.path);
     update();
   

   
  
}
}