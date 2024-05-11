
// ignore_for_file: await_only_futures

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:transmobile/model/client/ClientModel.dart';

class shared{

  void clear()async{
SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    sharedpreferences.clear();

  }

 static Future<bool?> getTransporteur()async{
    
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    
      return  sharedpreferences.getBool("isLogged")==true  && sharedpreferences.getBool("transporteur") == true;
    
  
  }
  static  Future<bool?>  getClient()async{
    
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    
      return sharedpreferences.getBool("isLogged")==true  && sharedpreferences.getBool("client") == true;
    
  
  }

  static  Future<bool?>  noCnoT()async{
    
    SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    
      return sharedpreferences.getBool("isLogged")==true  && sharedpreferences.getBool("client") == false && sharedpreferences.getBool("transporteur") == false;
  
  }
   static Future<String?>  getuser()async{
        SharedPreferences sharedpreferences = await SharedPreferences.getInstance();      
         return  await sharedpreferences.getString("user");
    }


   static Future<String?> gettoken()async{
            SharedPreferences sharedpreferences = await SharedPreferences.getInstance();  
         return   await sharedpreferences.getString("token")??"token:";
 
    }

    static saveUser(ClientModel user)async{
        SharedPreferences sharedpreferences = await SharedPreferences.getInstance();  
  sharedpreferences.setString("user", jsonEncode(user) );
    }

}