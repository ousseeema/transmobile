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
      'content-type': 'application/json; charset=utf-8',
      'authorization': 'bearer   $token',
    };
  }

   Future<Response> postRequest(String uri, data )async{  
    try{
      Response response = await post(uri,
       jsonEncode(data) ,
       headers:headers, 
        );
        return response;


    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());

    }

   }


}
