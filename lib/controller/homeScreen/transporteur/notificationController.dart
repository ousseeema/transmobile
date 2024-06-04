// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/view/utils/appConstant.dart';

import '../../../model/demande livrasion/demandelivr.dart';

class TransnotificationController extends GetxController{
 

 List<DemandeLiv> DemandesLivrasion = [];
 bool Demande_Loader = false; 
 GetAlldemandeForCurrentTrip()async{
  Demande_Loader = true ; 
  update();
  try {
    Response Demandes = await Get.find<UserApi>().GetRequest(AppConstant.Transgetalldemande);

   if(Demandes.body["success"]){
     DemandesLivrasion = [];
     Demandes.body["data"].forEach((demande){
      DemandesLivrasion.add(DemandeLiv.fromJson(demande));
     });
Future.delayed(Duration.zero, () {
        Demande_Loader = false; 
          update();
        });
        
      Get.snackbar("Success", Demandes.body["message"],
            backgroundColor: Colors.green, colorText: Colors.white);
            


   }else{
    Future.delayed(Duration.zero, () {
        Demande_Loader = false; 
          update();
        });
        
      Get.snackbar("Error", Demandes.body["message"],
            backgroundColor: Colors.red, colorText: Colors.white);
            Get.back();

   }

  } catch (e) {
    Future.delayed(Duration.zero, () {
        Demande_Loader = false; 
          update();
        });
        
      Get.snackbar("Error","Error in the Server",
            backgroundColor: Colors.red, colorText: Colors.white);
            Get.back();

    
  }






 }


}