import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/repository/client/ClientRepo.dart';
import 'package:transmobile/view/utils/shared.dart';

class HomeController extends GetxController{

 List<TransporterModel> Transporteurs =[];
   List<TripModel> trips=[];
bool isloading =true;
ClientModel? client;


Future<void>  LoadData()async {
  Transporteurs=[];
  // this is the responsable if we tap in refresh button this will display the shimmer effect
  isloading=true;
  update();

  
  // connverting the user data into client model 
     await shared.getuser().then((value) {
      client = ClientModel.fromJson(jsonDecode(value!));

     });
   

  
  // getting the transporter's from the data base 
  Response TransResponse = await ClientRepo().GetAllTransporteurs();
  Response TripResponse = await ClientRepo().GetCurrentTrip();
  // adding the stats endpoint in the future

  if(TripResponse.body["success"] && TransResponse.body["success"]){
        TransResponse.body['data'].forEach((transporter)=> Transporteurs.add(TransporterModel.fromJson(transporter)));
        TripResponse.body["data"].forEach((trip)=> trips.add(TripModel.fromJson(trip)));
           
        
        isloading=false;
        update();


  }else{
   
    Get.snackbar("Error", "Error while getting data , Try reloading the page", colorText: Colors.white, backgroundColor: Colors.red);

  }
   
    



 }





}