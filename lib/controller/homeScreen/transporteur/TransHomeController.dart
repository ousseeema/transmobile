// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/shared.dart';

class transHomeController extends GetxController{
 
  
  TransporterModel? transporter ;
  bool isloading = false;
    TripModel? Trip;
  

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
          Response currentTransporteur = await Get.find<UserApi>().GetRequest(AppConstant.getCurrentTransporteur);
              // getting current trip if its exist
              Response currentTrip = await Get.find<UserApi>().GetRequest(AppConstant.getCurrentTrip);
    
      if (
          currentTransporteur.body['success'] &&
          currentTrip.body['success']
          ) {
            //! getting current trip if it existe and transfer it to a trip model 

                       if(
                        currentTrip.body['len']>0
                       ){
                         Trip = TripModel.fromJson(currentTrip.body['data']);
                       }

            // save in the shared pref the user with the new updated user if its updatedd
            shared.saveTransporter(TransporterModel.fromJson(currentTransporteur.body['data']));
            
             transporter = TransporterModel.fromJson(currentTransporteur.body['data']);
 
        isloading = false;
        update();
      } else {
        Get.snackbar(
            "Error", "Error while getting data , Try reloading the page",
            colorText: Colors.white, backgroundColor: Colors.red);
      }
   
  }






}