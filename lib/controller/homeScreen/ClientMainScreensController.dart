import 'package:get/get.dart';
import 'package:transmobile/model/client/ClientModel.dart';
import 'package:transmobile/view/home%20screen/Client/home%20Pages/Home.dart';
import 'package:transmobile/view/home%20screen/Client/messages%20Pages/messages.dart';
import 'package:transmobile/view/home%20screen/Client/notifications%20Pages/Notifications.dart';
import 'package:transmobile/view/home%20screen/Client/search%20Pages/search.dart';
import 'package:transmobile/view/home%20screen/Client/settings%20Pages/settings.dart';

class ClientMainScreensController extends GetxController{
  
   // ! client model 
  ClientModel? client;
   
List Pages =[
 const Home(),
 const  messagesScreen(),
 const  notificationScreen(),
 const searchScreen(),
 const SettingsScreen(),
];



}