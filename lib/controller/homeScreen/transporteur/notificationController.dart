// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/view/utils/appConstant.dart';

import '../../../model/demande livrasion/demandelivr.dart';

class TransnotificationController extends GetxController {
  List<DemandeLiv> DemandesLivrasion = [];
  bool Demande_Loader = false;
  Future<void> GetAlldemandeForCurrentTrip() async {
    Demande_Loader = true;
    update();
    try {
      Response Demandes =
          await Get.find<UserApi>().GetRequest(AppConstant.Transgetalldemande);

      if (Demandes.body["success"]) {
        DemandesLivrasion = [];
        Demandes.body["data"].forEach((demande) {
          DemandesLivrasion.add(DemandeLiv.fromJson(demande));
        });
     DemandesLivrasion=    DemandesLivrasion.reversed.toList();

        Future.delayed(Duration.zero, () {
          Demande_Loader = false;
          update();
        });

        Get.snackbar("Success", Demandes.body["message"],
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        Future.delayed(Duration.zero, () {
          Demande_Loader = false;
          update();
        });

        Get.snackbar("Error", Demandes.body["message"],
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Future.delayed(Duration.zero, () {
        Demande_Loader = false;
        update();
      });

      Get.snackbar("Error", "Error in the Server",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  late DemandeLiv Selected_Demande;

  // accept the request and send notification to the user 
  bool accept_loader = false;
  acceptedRequest() async {
    accept_loader = true;
    update();

      Response AcceptedRequest = await Get.find<UserApi>().TransputRequest(
          {}, AppConstant.transacceptDemande,Selected_Demande.id);
         
      if (AcceptedRequest.body["success"]) {
        Selected_Demande.accepted = true;
        accept_loader = false;
        update();
        String message = "Your request has been accepted by ${Selected_Demande.transporter.fullName}";
        String title = "Request Status : " ; 
        List <String>userIds = [Selected_Demande.client.pushNotificationId??""];
        Response send_Notification = await Get.find<UserApi>().sendNotification(userIds, AppConstant.TranssendNotification, message, title);

       
        Get.snackbar("Success", AcceptedRequest.body["message"],
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        accept_loader = false;
        update();
        Get.snackbar("Error", AcceptedRequest.body["message"],
            backgroundColor: Colors.red, colorText: Colors.white);
      }
   
  
   
  }

  // refuse the request

  rejectRequest() async {
    accept_loader = true;
    update();

    try {
      Response rejectRequest = await Get.find<UserApi>().TransputRequest(
          {}, AppConstant.TransrefuseDemande,Selected_Demande.id);
      if (rejectRequest.body["success"]) {
        Selected_Demande.refused = true;
        accept_loader = false;
          String message = "Your request has been refused by ${Selected_Demande.transporter.fullName}";
        String title = "Request Status : " ; 
        List <String>userIds = [Selected_Demande.client.pushNotificationId??""];
        Response send_Notification = await Get.find<UserApi>().sendNotification(userIds, AppConstant.TranssendNotification, message, title);
        
       
        update();
        Get.snackbar("Success", rejectRequest.body["message"],
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        accept_loader = false;
        update();
        Get.snackbar("Error", rejectRequest.body["message"],
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
    
      accept_loader = false;
      update();
      Get.snackbar("Error", "Error in the Server",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
