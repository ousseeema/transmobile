// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/repository/client/ClientRepo.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/shared.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeController extends GetxController {
  //all trips

// sites image name
  List<String> get_site_images = [
    "amazon.jpg",
    "aliexpress.png",
    "ebay.jpeg",
    "temu.jpg",
    "shein.jpeg",
  ];

  List<TripModel> alltrips = [];
  // current trip
  List<TripModel> trips = [
   
  ];

  bool isloading = true;
  ClientModel? client;
  List<TransporterModel> transporteurs = [];

  Future<void> LoadData() async {
    List<TransporterModel> transporteurs = [];
    alltrips = [];
    trips=[];
    // this is the responsable if we tap in refresh button this will display the shimmer effect
    isloading = true;
    update();

    // connverting the user data into client model

    await shared.getuser().then((value) {
      client = ClientModel.fromJson(jsonDecode(value!));
    });
    // getting the transporter's from the data base

 
      
      Response TripsResponse = await ClientRepo().GetAllTrips();
      Response CurrentTripResponse = await Get.find<UserApi>().GetRequest(AppConstant.usergetCurrentTrips);
      Response transporters = await Get.find<UserApi>()
          .GetRequest(AppConstant.usergetAllTransporter);

          Response currentClient = await Get.find<UserApi>().GetRequest(AppConstant.getCurrentUser);
      // adding the stats endpoint in the future

      if (TripsResponse.body["success"] &&
          CurrentTripResponse.body["success"] &&
          transporters.body['success']&&
          currentClient.body['success']
          ) {
            // save in the shared pref the user with the new updated user if its updatedd
            shared.saveUser(ClientModel.fromJson(currentClient.body['data']));
            
             client = ClientModel.fromJson(currentClient.body['data']);
 



        //all trips
        TripsResponse.body['data']
            .forEach((trip) => alltrips.add(TripModel.fromJson(trip)));

        //current trips
        CurrentTripResponse.body["data"]
            .forEach((currenttrip) => trips.add(TripModel.fromJson(currenttrip)));

        isloading = false;
        update();
      } else {
      
        Get.snackbar(
            "Error", "Error while getting data , Try reloading the page",
            colorText: Colors.white, backgroundColor: Colors.red);
            
      }
    
    
  }

  // launcing url of the sites
  List<String> Sitesurl=[
     "https://www.amazon.com/",
     "https://www.aliexpress.com/",
     "https://www.ebay.com/",
     "https://www.temu.com/fr",
     "https://www.shein.com/"

  ];
  launchURL(int index) async {
    String  site =Sitesurl[index];
    Uri uri = Uri.parse(site);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar("Error ", "Error Launching Site");
    }
  }
}
