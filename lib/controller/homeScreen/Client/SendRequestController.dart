// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/view/utils/appConstant.dart';

class SendRequestController extends GetxController{
 File? SelectedImage;
 String phoneNumberof_the_sender="";
String phoneNumberof_the_receiver="";
String pickupAddress="";
String receivedAdress="";
double  totalkg=0;
bool home_delivery = false ;
bool home_pickups = false ;
String TransporterUID =Get.find<DetailsResult>().SelectedTrip!.transporter.id;
bool is_Loading = false;

void sendRequest()async{

Map<String , dynamic> message={
  "numberofkg": totalkg.toString(),
  "phoneNumberof_the_sender":phoneNumberof_the_sender,
  "phoneNumberof_the_receiver": phoneNumberof_the_receiver,
  "Pickupaddress":pickupAddress,
  "receivedAdress": receivedAdress,
  "homepickup": home_delivery.toString(),
  "homedelivery": home_delivery.toString(),

};
 Map<String , dynamic>data ={
  "transporter": TransporterUID,
  "message":message,
  

 };
 String requestData = json.encode(data);
 FormData datatosend = FormData(
    {
   "data" :requestData,
   "file" : MultipartFile(SelectedImage!.readAsBytesSync(), filename: 'image.jpg')
    } 
   );
    is_Loading= true;
      update();


  Response SendReqResponse = await  Get.find<UserApi>().postRequest(datatosend, AppConstant.usersendrequest) ;

  if(SendReqResponse.body["success"] == true){
    
  }


}




 void homedelivery_Change(value){
  home_delivery = value;
  update();
 }
 void homepickups_Change(value){
  home_pickups = value;
  update();
 }

Future PickimageFromGallery()async{
   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
     

  if(image == null){
    update();
    return ;
  }
   
     SelectedImage = File(image.path);
     update();
   

}



bool check_Number(){
    if(phoneNumberof_the_sender.length<6){
      return false ;
    }
    else if( phoneNumberof_the_receiver.length<6 ){
     return false ;
    }
    return true; 
  }

// validate the input then send the data to the serveur

void check_before_send()async{

    if(SelectedImage == null  ){
    Get.snackbar("Error", "Ops! Please select a package image ", colorText: Colors.white, backgroundColor: Colors.red);

    }else if(await SelectedImage!.length() >1000000){
     Get.snackbar("Error", "Ops! Please select a package image that her size less then 1MB ", colorText: Colors.white, backgroundColor: Colors.red);

    }
    else if(!check_Number()){
    Get.snackbar("Error", "Ops! Missing phone number ", colorText: Colors.white, backgroundColor: Colors.red);

    }
    
    
   

    else if(totalkg==0){
     Get.snackbar("Error", "Ops! Please enter the total KG ", colorText: Colors.white, backgroundColor: Colors.red);

    }
    
    else {
      // send the demande request  to serveur to update the details 
      //  ! and if the respons status is sccess update response_success and go to the next page
        
  
    }
    
    

}



   
}