import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/resultController.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/repository/client/ClientRepo.dart';
import 'package:transmobile/view/home%20screen/Client/search%20Pages/result.dart';

class searchController extends GetxController {
  TextEditingController googleSearchController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  bool home_delivery = false;
  bool home_pickup = false;
  bool parcels = false;
  double coastkg = 0;
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
      parcels = value;
      update();
    }
  }

  // searech function
  //! sending the details to the server and the server will send the list of transporteurs that have that specific details

  void SearchForTrip() async {
     Get.find<ResultController>().tripsafterFilter = [];
    trips = [];
    isLoading = true;
    update();
    // query to ssend to the serveur
    Map<String, dynamic> query = {
      "Home_delivery": home_delivery.toString(),
      "Home_pick_up": home_pickup.toString(),
      "isDone":"false"
    };

    // send the request to the serveur
    try {
      Response response = await ClientRepo().SearchForTrip(query);

    if (response.body["success"] == true) {
      // convert the response body to trip object and add to the list type trip model
      response.body['data']
          .forEach((trip) => trips.add(TripModel.fromJson(trip)));
      // filtring the data with the specific details entered in the search page
      if(googleSearchController.text.isEmpty && dateController.text.isEmpty && coastkg== 0){
         Get.find<ResultController>().tripsafterFilter = trips;

      }
      else if(googleSearchController.text.isEmpty == false  && dateController.text.isEmpty && coastkg== 0){
        for (var trip in trips) {
          for (var city in trip.citys) {
            if (trip.transporter.parsols == parcels 
            && city.city == googleSearchController.text
               ) {
               Get.find<ResultController>().tripsafterFilter.add(trip);
              break;
            }
          }
        
      }
      }
      else if(googleSearchController.text.isEmpty == false && dateController.text.isEmpty== false && coastkg== 0){
        for (var trip in trips) {
          for (var city in trip.citys) {
            if (trip.transporter.parsols == parcels &&                
                city.city == googleSearchController.text &&
                city.dateofpassage == dateController.text
               ) {
               Get.find<ResultController>().tripsafterFilter.add(trip);
              break;
            }
          }
        
      }

      }else if(googleSearchController.text.isEmpty == false && dateController.text.isEmpty== false && coastkg > 0)
      {
          for (var trip in trips) {
      
          for (var city in trip.citys) {
            if (trip.transporter.parsols == parcels &&
                trip.transporter.priceKg >= coastkg - 2 &&
                trip.transporter.priceKg <= coastkg + 2 &&
                city.city == googleSearchController.text &&
                city.dateofpassage.substring(0, 11) == dateController.text) {
              Get.find<ResultController>().tripsafterFilter.add(trip);
              break;
            }
          }
        
      }
      }
      
      

      Get.to(() => const SearchResult());
   Future.delayed(const Duration(seconds: 1), () {
          isLoading = false;
          update();
        });
    
      update();
    } else {
      Get.snackbar("Ops",
          "Erreur while getting data \n try again or check your connection",backgroundColor: Colors.red, colorText: Colors.white);
     
      isLoading = false;
      update();
    }
      
    } catch (e) {
      Get.snackbar("Ops",
          "Check your internet connection",backgroundColor: Colors.red, colorText: Colors.white);
     
    }
  }






  
}
