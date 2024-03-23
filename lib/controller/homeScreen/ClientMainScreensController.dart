import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
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
  bool isloading =true;
   // ! client model 
 ClientModel? client;
   List<TransporterModel> Transporteurs =[];
  // List<TripModel> trips=[];
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



 void LoadData()async {
  Transporteurs=[];

  // getting the transporter's from the data base 
  Response TransResponse = await ClientRepo().GetAllTransporteurs();
  Response TripResponse = await ClientRepo().GetCurrentTrip();
  // adding the stats endpoint in the future
  if(TripResponse.body.success == true&& TransResponse.body.success == true ){
        TransResponse.body['data'].forEach((transporter)=> Transporteurs.add(TransporterModel.fromJson(transporter)));
      //  TripResponse.body["data"].forEach((trip)=>   )
      


  }else{


  }
   
    



 }



}