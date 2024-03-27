import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/model/trans/transporteruModel.dart';
import 'package:transmobile/repository/client/ClientRepo.dart';
import 'package:transmobile/view/home%20screen/Client/home%20Pages/Home.dart';
import 'package:transmobile/view/home%20screen/Client/messages%20Pages/messages.dart';
import 'package:transmobile/view/home%20screen/Client/notifications%20Pages/Notifications.dart';
import 'package:transmobile/view/home%20screen/Client/search%20Pages/search.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/settings.dart';

class ClientMainScreensController extends GetxController{
  int currentIndex = 0;
  
   // ! client model 
  
List<Widget> Pages =[
 const Home(),
 const  messagesScreen(),
 const  notificationScreen(),
 const searchScreen(),
 const SettingsScreen(),
];

 void changePages(index){
  currentIndex = index;
  update();
 }







}