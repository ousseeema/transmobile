import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/repository/client/ClientRepo.dart';
import 'package:transmobile/view/home%20screen/Client/search%20Pages/result.dart';

class searchController extends GetxController {
  TextEditingController dateController = TextEditingController();
  bool home_delivery = false;
  bool home_pickup = false;
  bool parcels = false;
  double coastkg=0;
  bool isLoading = false;
  List<TripModel> trips = [];

  void change_value(bool value, String variable) {
    if (variable == "Pickup") {
      home_pickup = value; 
      update();
    } else if (variable == "delivery") {
      home_delivery = value;
      update();
    } else if (variable == "parcles") {
      parcels=value;
      update();
    }
  }

  // searech function 
  //! sending the details to the server and the server will send the list of transporteurs that have that specific details

 void SearchForTrip()async{
   trips=[];
   isLoading= true;
   update();
  String query = "";
  Response response = await ClientRepo().SearchForTrip(query);

  if(response.body["success"]== true){
    response.body['data'].forEach((trip) =>
          trips.add(TripModel.fromJson(trip)));
          Get.to(()=> const SearchResult());
          isLoading =false;
          update();

  }else{
    Get.snackbar("Ops", "Erreur while getting data \n tryagain or check your connection");
    isLoading=false;
    update();

  }

 }





}
