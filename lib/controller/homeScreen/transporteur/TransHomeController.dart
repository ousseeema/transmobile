// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/shared.dart';

class transHomeController extends GetxController {
  TransporterModel? transporter;
   String? newCity;
   int? newCityIndex;
  bool isloading = false;
  TripModel? Trip ;

  Future<void> LoadData() async {
    await shared.getuser().then((value) {
      transporter = TransporterModel.fromJson(jsonDecode(value!));
    });
    // this is the responsable if we tap in refresh button this will display the shimmer effect
    isloading = true;
    update();

   
   
    // getting current transporteur
    Response currentTransporteur = await Get.find<UserApi>()
        .GetRequest(AppConstant.getCurrentTransporteur);
    // getting current trip if its exist
    Response currentTrip =
        await Get.find<UserApi>().GetRequest(AppConstant.getCurrentTrip);

    if (currentTransporteur.body['success'] && currentTrip.body['success']) {
      //! getting current trip if it existe and transfer it to a trip model

     
        
        if(currentTrip.body["data"]!=null) {
           Trip = TripModel.fromJson(currentTrip.body["data"]);      
        }

      // save in the shared pref the user with the new updated user if its updatedd
      shared.saveTransporter(
          TransporterModel.fromJson(currentTransporteur.body['data']));

      transporter = TransporterModel.fromJson(currentTransporteur.body['data']);

      isloading = false;
      update();
    } else {
      Get.snackbar("Error", currentTrip.body["messsage"],
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
  /// ! changing the status of specified city
  void DoneCity(index) async {
    Trip!.citys[index].done = true;
    isloading = true;
    update();
  
    
      Response updatedTrip = await Get.find<UserApi>()
        .TransputRequest(Trip!.citys, AppConstant.TransupdateTrip, Trip!.id);
    if (updatedTrip.body["success"]) {
      Trip = TripModel.fromJson(updatedTrip.body['data']);
      isloading = false;
      update();
      Get.snackbar("Success", "Trip updated successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
       Trip!.citys[index].done = false;
      isloading = false;
      update();
      Get.snackbar("Error", "Trip cannoot be updated ",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  
  }
  //! delete a specific city from the list
   void DeleteCity(index) async {
   
    isloading = true;
    update();
   try {
      Trip!.citys.removeAt(index);
      Response updatedTrip = await Get.find<UserApi>()
        .TransputRequest(Trip!.citys, AppConstant.TransupdateTrip, Trip!.id);
    if (updatedTrip.body["success"]) {
      Trip = TripModel.fromJson(updatedTrip.body['data']);
      isloading = false;
      update();
      Get.snackbar("Success", "Trip updated successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      isloading = false;
      update();
      Get.snackbar("Error", "Trip cannoot be updated ",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
   } catch (e) {
    isloading = false;
      update();
      Get.snackbar("Error", "Trip cannoot be updated ",
          backgroundColor: Colors.red, colorText: Colors.white);
     
   }
    
   
  }

  //! update the trip or delete it from the edit/add text
  
  void updateTrip()async{
    //! update the trip by addding the city to the specified index
    isloading = true;
    update();
   
      if(newCity!.isEmpty|| (newCityIndex==null|| newCityIndex ==0)){

         Get.snackbar("Error ", "The new city and the position must be provided " ,backgroundColor: Colors.red, colorText: Colors.white)  ;
         isloading = false;
         update();
      }else{
        try {
          
         Trip!.citys.insert(newCityIndex!-1, City(id: "", city: newCity!, dateofpassage: DateTime.now().toString(), done: false) );
      Map<String, dynamic> datatoSend={
        "Citys" : Trip!.citys
      };
      Response updatedTrip = await Get.find<UserApi>()
        .TransputRequest(datatoSend, AppConstant.TransupdateTrip, Trip!.id);
    if (updatedTrip.body["success"]) {
      Trip = TripModel.fromJson(updatedTrip.body['data']);
      isloading = false;
      update();
      Get.back();
      Get.snackbar("Success", "Trip updated successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      
      isloading = false;
      update();
      Get.snackbar("Error", "Trip cannoot be updated ",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
        } catch (e) {
             isloading = false;
      update();
      Get.snackbar("Error", "Connection error",
          backgroundColor: Colors.red, colorText: Colors.white);
        }
      }
   
    
  }


  //! delete the current trip 
  void DeleteTrip()async{
   isloading = true; 
   update();

   try {
     Response deletedTrip = await Get.find<UserApi>().TransDeleteRequest(AppConstant.TransDeleteTrip, Trip!.id);
     

     if(deletedTrip.body["success"] == true){
       isloading = false;
      update();
      Get.back();
      Get.snackbar("Success", "Trip Deleted successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
      
     }
     else{
      isloading = false;
      update();
      Get.snackbar("Error",deletedTrip.body["success"],
          backgroundColor: Colors.red, colorText: Colors.white);
     }

  
  
  
   } catch (e) {
    isloading = false;
  
      update();
      Get.snackbar("Error", "Connection error",
          backgroundColor: Colors.red, colorText: Colors.white);
     
   }

  }

//! Done the trip and add it to histiory page
  void DoneTrip()async{


 isloading = true; 
   update();

   try {
     Response doneTrip = await Get.find<UserApi>().TransputRequest("", AppConstant.TransaddTriptohistory, Trip!.id);
     

     if(doneTrip.body["success"] == true){
       isloading = false;
      update();
      Get.back();
      Get.snackbar("Success", "Trip add to history List successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
      
     }
     else{
      isloading = false;
      update();
      Get.snackbar("Error",doneTrip.body["message"],
          backgroundColor: Colors.red, colorText: Colors.white);
     }

  
  
  
   } catch (e) {
    isloading = false;
  
      update();
      Get.snackbar("Error", "Connection error",
          backgroundColor: Colors.red, colorText: Colors.white);
     
   }
  }
    void Homedelivery_change( value){
      homeDelivery = value;
      update();
    }

// add single package function and attributes
 
 String fullname="";
  String phoneNumber="";
   String pickupCity="";
    String DeliveryCity="";
    int numberOfPackages=0;
    int totalamount=0;
    bool homeDelivery=false;
    String exacteAddress="";


   void addpackage()async{

   isloading=true;
   update();


   if(fullname.isEmpty || phoneNumber.isEmpty|| pickupCity.isEmpty || DeliveryCity.isEmpty || numberOfPackages==0 || totalamount==0|| exacteAddress.isEmpty){
   
    Get.snackbar("Error", "Provide your data first please!",
          backgroundColor: Colors.red, colorText: Colors.white);
   isloading=false;
   update();
    

   }else{



    try {
      Map<String, dynamic> data ={
        'fullname' : fullname,
        "phoneNumber" : phoneNumber,
        "pickupCity" : pickupCity,
        "DeliveryCity" : DeliveryCity,
        "numberOfPackages" : numberOfPackages,
        "homeDelivery" : homeDelivery,
        "exacteAddress" : exacteAddress,
        "amount" : totalamount

      };

      Response addpackageResponse = await Get.find<UserApi>().TransputRequest(data, AppConstant.TransAddsinglePackage, Trip!.id);
        if(addpackageResponse.body["sucess"]){
            isloading = false;
      update();
      Get.back();
      Get.snackbar("Success", "package add to packages List successfully",
          backgroundColor: Colors.green, colorText: Colors.white);
      



        }else{
 isloading = false;
      update();
      Get.snackbar("Error",addpackageResponse.body["message"],);
        }
      
    } catch (e) {
       isloading = false;
  
      update();
      Get.snackbar("Error", "Connection error",
          backgroundColor: Colors.red, colorText: Colors.white);
     
      
    }
   }


   }


   void resetForm(){
    fullname="";
   phoneNumber="";
    pickupCity="";
     DeliveryCity="";
     numberOfPackages=0;
     totalamount=0;
     homeDelivery=false;
     exacteAddress="";
     update();

   }




}
