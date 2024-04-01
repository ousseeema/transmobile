
import 'package:get/get.dart';
import 'package:transmobile/view/utils/appConstant.dart';

class UserApi extends GetConnect implements GetxService {
  late String token;

  late String baseurl;
  late Map<String,String> headers ;

  UserApi() {
    token = AppConstant.token;
    baseurl = AppConstant.baseurl;
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'bearer   $token',
    };
  }

   Future<Response> postRequest(data, String uri )async{ 
    try{
      Response response = await post("$baseurl$uri",
         data ,
       contentType: "application/json", 
        );
        return response;


    }catch(e){
      return const Response(
        body: {
          "message": "error in serveur",
          "success": false
        },
        statusCode: 1,
         
         
         );

    }

   }


     Future<Response> putRequest(data, String uri )async{ 
    try{
      Response response = await put("$baseurl$uri",
         data ,
       contentType: "application/json", 
        );
        return response;


    }catch(e){
      return const Response(
        body: {
          "message": "error in serveur",
          "success": false
        },
        statusCode: 1,
         
         
         );

    }

   }
   

   // get request 
   Future<Response> GetRequest(String uri)async{ 
    try{
      Response response = await get(
        "$baseurl$uri",
        headers: {
           'Authorization': 'Bearer $token',
        },
      
       contentType: "application/json", 
        );
        return response;


    }catch(e){
      return const Response(
        body: {
          "message": "error in serveur",
          "success": false
        },
        statusCode: 1,
         
         
         );

    }
   

   }
    // get methodde for the search for a trip 
    Future<Response> SearchForTrip(query)async{
      try {
        Response response = await get(baseurl + AppConstant.usersearchTrip+ query,
        headers: {
           'Authorization': 'Bearer $token',
        },
      
       contentType: "application/json", 
        );
        return response;
        
      } catch (e) {
         return const Response(
        body: {
          "message": "error in serveur",
          "success": false
        },
        statusCode: 1,
         
         
         );

        
      }
      
    }



}
