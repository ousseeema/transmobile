import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:transmobile/view/home%20screen/Client/home%20Pages/Home.dart';
import 'package:transmobile/view/home%20screen/Client/messages%20Pages/messages.dart';
import 'package:transmobile/view/home%20screen/Client/notifications%20Pages/Notifications.dart';
import 'package:transmobile/view/home%20screen/Client/search%20Pages/search.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/settings.dart';

class ClientMainScreensController extends GetxController{
  int currentIndex = 0;
  
  
  
List<Widget> Pages =[
 const Home(),
 const  messagesScreen(),
  const searchScreen(),
 const  notificationScreen(),

 const SettingsScreen(),
];

 void changePages(index){
  currentIndex = index;
  update();
 }







}