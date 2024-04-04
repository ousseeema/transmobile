import 'package:get/get.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';

class DetailsResult extends GetxController{




TripModel?  SelectedTrip ;
  void selectedtrip(TripModel selectedone){
    SelectedTrip = selectedone;  
  }
}