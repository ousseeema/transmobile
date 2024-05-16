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
    // this is the responsable if we tap in refresh button this will display the shimmer effect
    isloading = true;
    update();

    // connverting the user data into client model

    await shared.getuser().then((value) {
      transporter = TransporterModel.fromJson(jsonDecode(value!));
    });
    // getting the transporter's from the data base

    // getting current transporteur
    Response currentTransporteur = await Get.find<UserApi>()
        .GetRequest(AppConstant.getCurrentTransporteur);
    // getting current trip if its exist
    Response currentTrip =
        await Get.find<UserApi>().GetRequest(AppConstant.getCurrentTrip);

    if (currentTransporteur.body['success'] && currentTrip.body['success']) {
      //! getting current trip if it existe and transfer it to a trip model

     
        
        
           Trip = TripModel.fromJson(currentTrip.body["data"]);
       
      

      // save in the shared pref the user with the new updated user if its updatedd
      shared.saveTransporter(
          TransporterModel.fromJson(currentTransporteur.body['data']));

      transporter = TransporterModel.fromJson(currentTransporteur.body['data']);

      isloading = false;
      update();
    } else {
      Get.snackbar("Error", "Error while getting data , Try reloading the page",
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
   
  try {
         Trip!.citys.insert(newCityIndex!-1, City(id: "", city: newCity!, dateofpassage: DateTime.now().toString(), done: false) );

      Response updatedTrip = await Get.find<UserApi>()
        .TransputRequest(Trip!.citys, AppConstant.TransupdateTrip, Trip!.id);
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
       print(e);
      isloading = false;
      update();
      Get.snackbar("Error", "Connection error",
          backgroundColor: Colors.red, colorText: Colors.white);
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
    print(e);
      update();
      Get.snackbar("Error", "Connection error",
          backgroundColor: Colors.red, colorText: Colors.white);
     
   }

  }
}
