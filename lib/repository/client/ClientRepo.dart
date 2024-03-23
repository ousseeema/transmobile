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
    return  UserApi().GetRequest(AppConstant.getCurrentTrips);
   }

}