import 'package:get/get.dart';

class transDetailsRepo extends GetConnect  implements GetxService{

   Future<Response> GetPredictionsPlaces(String place){
    return  get(
     "maps.googleapis.com/maps/api/place/autocomplete/json",
      headers: {
        "content-type": "application/json",
        "input": place,
        "key":"AIzaSyD0dyk5YOJeMFVjy4QArElWN2asx4lGORA"

      }
   );
     
  }
}