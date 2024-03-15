import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:transmobile/controller/authController/signinController.dart';
import 'package:transmobile/repository/client/authRepo.dart';
import 'package:transmobile/repository/transporter/authTransRepo.dart';
import 'package:transmobile/view/login%20screens/resetpassword.dart';

class resetpassController extends GetxController {
  String email = "";
  String password = "";
  String repassword = "";
  bool is_Loading1 = false;
 bool onediting_verification_code =true;
 String verification_code ="";


 //! send veification code for the first time 
  void SendresetCode()async {
    if (email.isEmpty || !email.isEmail) {
      Get.snackbar("Error", "Email invalid ",
          colorText: Colors.white, backgroundColor: Colors.red);
    } else {
      bool user = Get.find<signinController>().isClient;
     //! send the verification code to the useremail 
          is_Loading1 = true;
          update();

            
        Map<String,dynamic> data = {
          "email" : email
        };
        String DataToSend=  jsonEncode(data);
        Response response;
           
            if(user){
              //! ken how user besh naabaath requet fiha el emaile li dakhla besh yaabathli reset code aala email heka 
             response = await authClientRepo().sendResetCode(DataToSend);
             if(response.body["success" ]==true){

                   Get.snackbar("Success",response.body["message"] ,
                  colorText: Colors.white, backgroundColor: Colors.green);
                 
                  Future.delayed(const Duration(seconds: 1), () {
               is_Loading1 = false;
                 });
                 update();
                  Get.to(()=> const  resetpassword());
                   




             }else{

               is_Loading1 = false;
                update();

               Get.snackbar("Error", response.body["message"], colorText: Colors.white, backgroundColor: Colors.red);


             }
             
  
                
              






            }else{

                      //!ken how transporteur nbaaathla request fiha email besh ybaathli reset code 
                   response = await authTrasnRepo().sendResetCode(DataToSend);
                   
                   if(response.body["success" ]==true){
                   

                   Get.snackbar("Success",response.body["message"] ,
                  colorText: Colors.white, backgroundColor: Colors.green);
                  Get.to(()=> const  resetpassword());
                  Future.delayed(const Duration(seconds: 1), () {
                  is_Loading1  = false;
                 });
                   update();




             }else{

               is_Loading1 = false;
                update();

               Get.snackbar("Error", response.body["message"], colorText: Colors.white, backgroundColor: Colors.red);


             }







            }


    






    }
  }




 //! resend verification code to the useremail 
  void resendresetcode(){
   // resend verification code to the useremail 
    



  }



 // send the new password and the code to the serveur to check and update 
    void reset_password(){
     
     if(verification_code.isEmpty){
      Get.snackbar("Error",
          "Please enter your code",
          colorText: Colors.white, backgroundColor: Colors.red);
    
     }
    else if (password.isEmpty ||
        password.length < 8 ||
        password.contains(RegExp(r'^(?=.*[a-zA-Z])(?=.*\d{7,}).{8,}$'))) {
      Get.snackbar("Error",
          "Password must be at least 8 characters long",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
   else if ( !( repassword == password)) {
      Get.snackbar("Error", "Password must the same",
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    else{


    }
    


    }      


}
