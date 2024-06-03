// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/view/utils/appConstant.dart';

class AddTripController extends GetxController {
  bool isloading = false;
  bool home_pick_up = false;
  bool home_delivery = false;

  List<List<dynamic>> TextControllers = [
    [TextEditingController().text, TextEditingController().text]
  ];

  void addInputfield() {
    TextControllers.add(
        [TextEditingController(), TextEditingController().text]);
    update();
  }

  void deleteInputfield(index) {
    TextControllers.removeAt(index);
    update();
  }

  void PickDate(index, value) {
    TextControllers[index][1] = value.toString().substring(0, 11);
    update();
  }
  void home_deliverychange(value){
    home_delivery =value;
    update();
  }
  void home_pickupchange(value){
    home_pick_up =value;
    update();
  }


  void addTrip() async {
  
 
      if (TextControllers.length == 1) {
        Get.snackbar("Error", "Trip cannoot be composed of 1 city ",
            backgroundColor: Colors.red, colorText: Colors.white);
      } else {
          isloading = true;
    update();
     
        List Citys = [];

        TextControllers.forEach((element) {
        
          Citys.add({
        'city': element[0],
        'dateofpassage': element[1],
      });
         
        });

       Map<String,dynamic> datatosend ={
           "Citys":Citys,
           "home_pick_up": home_pick_up,
           "Home_delivery": home_delivery
       };
        Response addTripResponse = await Get.find<UserApi>()
            .postRequest(datatosend, AppConstant.TransaddTrip);
            print(addTripResponse.body["message"]);
        if (addTripResponse.body["success"] == true) {
          Get.snackbar("Success", "Trip add successfully",
              backgroundColor: Colors.green, colorText: Colors.white);
          TextControllers = [
            [TextEditingController().text, TextEditingController().text]
          ];

          isloading = false;
          update();
        } else {
          isloading = false;
          update();
          Get.snackbar("Error", "Trip cannoot be created due to data error ",
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      }
   
  }
}
