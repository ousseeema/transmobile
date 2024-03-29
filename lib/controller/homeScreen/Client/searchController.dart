import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class searchController extends GetxController {
  TextEditingController dateController = TextEditingController();
  bool home_delivery = false;
  bool home_pickup = false;
  bool parcels = false;
  double coastkg=0;

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
}
