// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:transmobile/api/api.dart';
import 'package:transmobile/view/utils/appConstant.dart';

class ClientRepo extends GetxService{

//! getting all transporteurs

Future<Response> GetAllTransporteurs(){
    return  UserApi().GetRequest(AppConstant.usergetAllTransporter);
   }
//! getting current trips 
Future<Response> GetCurrentTrip(){
    return  UserApi().GetRequest(AppConstant.usergetCurrentTrips);
   }

   Future<Response> SearchForTrip(query){
    return UserApi().SearchForTrip(query);
   }
   // getting all trips
Future<Response> GetAllTrips(){
    return  UserApi().GetRequest(AppConstant.getalltrips);

   }
   
}