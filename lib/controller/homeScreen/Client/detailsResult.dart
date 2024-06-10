import 'package:get/get.dart';
import 'package:transmobile/model/TripModel/TripModel.dart';
import 'package:transmobile/view/home%20screen/Client/search%20Pages/detailsResult.dart';

class DetailsResult extends GetxController{




TripModel?  SelectedTrip ;
  void selectedtrip(TripModel selectedone){
    SelectedTrip = selectedone;  
    
    Get.to(()=> const detailsResult() );
  }

  
}