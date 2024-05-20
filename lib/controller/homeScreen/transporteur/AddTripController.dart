// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/view/utils/appConstant.dart';

class AddTripController extends GetxController {
  bool isloading = false;

  List<List<dynamic>> TextControllers = [
    [TextEditingController(), TextEditingController().text]
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

  void addTrip() async {
    isloading = true;
    update();
    try {
      Map<String, dynamic>data ={};

      TextControllers.forEach((element) {
        data['city'] = element[0];
        data["dateofpassage"] = element[1];
      });
      // Response addTripResponse = await Get.find<UserApi>().postRequest(data, AppConstant.TransaddTrip);
    } catch (e) {}
  }
}
