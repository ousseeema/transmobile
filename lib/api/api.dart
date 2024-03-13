import 'dart:convert';

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

   Future<Response> postRequest(FormData data, String uri )async{ 
   //String final_uri = '${baseurl}${uri}';
    try{
      Response response = await post("$baseurl${uri}",
         data ,
       contentType: "application/json", 
        );
        return response;


    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());

    }

   }


}
