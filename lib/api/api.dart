
import 'package:get/get.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/shared.dart';

class UserApi extends GetConnect implements GetxService {
  

  late String baseurl;
  late Map<String,String> headers ;

  UserApi() {
    
    baseurl = AppConstant.baseurl;
    headers = {
      'Content-Type': 'application/json',
     
    };
  }

   Future<Response> postRequest(data, String uri )async{ 
     String?  token = await  shared.gettoken();
    try{
      Response response = await post("$baseurl$uri",
         data ,
         headers: {
           'Authorization': "Bearer ${token!.substring(1,token.length-1)}",
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

     
   //! put request for the data and image together in the same request
     Future<Response> putRequest(dynamic data, String uri )async{ 
      String?  token = await  shared.gettoken();
    try{
      Response response = await put("$baseurl$uri",
         data ,
         headers: {
           'Authorization': "Bearer ${token!.substring(1,token.length-1)}",
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
   

   // get request 
   Future<Response> GetRequest(String uri)async{ 
    String?  token = await  shared.gettoken();

   
    try{
 
      Response response = await get(
        "$baseurl$uri",
        headers: {
           'Authorization':"Bearer ${token!.substring(1,token.length-1)}" ,
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
      String?  token = await  shared.gettoken();
      try {
        Response response = await get("${baseurl}${AppConstant.usersearchTrip}",
        query:query ,
        headers: {
           'Authorization': "Bearer ${token!.substring(1,token.length-1)}",
        },
      
       contentType: "application/json", 
        );

        return response;
        
      } catch (e) {
        
         return  Response(
        body: {
          "message": e,
          "success": false
        },
        statusCode: 1,
         
         
         );

        
      }
      
    }




//! transporteur function
 Future<Response> TransputRequest(dynamic data, String uri, id )async{ 
      String?  token = await  shared.gettoken();
    try{
      Response response = await put("$baseurl$uri$id",
         data ,
         headers: {
           'Authorization': "Bearer ${token!.substring(1,token.length-1)}",
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

   // delete request for the transporteur 
   Future<Response> TransDeleteRequest(String uri, id )async{ 
      String?  token = await  shared.gettoken();
    try{
      Response response = await delete("$baseurl$uri$id",
         
         headers: {
           'Authorization': "Bearer ${token!.substring(1,token.length-1)}",
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


}
