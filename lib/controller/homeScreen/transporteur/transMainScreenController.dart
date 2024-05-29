import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/view/home%20screen/trans/TransMainScreen.dart';
import 'package:transmobile/view/home%20screen/trans/add%20trip/addTrip.dart';
import 'package:transmobile/view/home%20screen/trans/home%20Pages/transHomePage.dart';
import 'package:transmobile/view/home%20screen/trans/messages%20Pages/transMessagePage.dart';
import 'package:transmobile/view/home%20screen/trans/notification%20Pages/transNotifPage.dart';
import 'package:transmobile/view/home%20screen/trans/settings%20Pages/transSettingsPage.dart';

class TransmainScreenController extends GetxController{
  int currentIndex = 0;
  
  
  
List<Widget> Pages =[
 const TransHomePage(),
 const  TransMessageScreen(),
 const AddTripScreen(),
  const TransNotificationScreen(),
  const TransSettingScreen()
 


];

 void changePages(index){
  currentIndex = index;
  update();
 }
}