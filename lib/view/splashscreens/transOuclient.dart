import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/authController/signinController.dart';
import 'package:transmobile/controller/authController/verificationcodeController.dart';
import 'package:transmobile/view/login%20screens/login.dart';
import 'package:transmobile/view/login%20screens/verificationCode.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransOuClient extends StatelessWidget {
  const TransOuClient({super.key});

         Widget button(String text){
          return GetBuilder<signinController>(builder: (controller){
            return GestureDetector(
            onTap: () {
               if(text == "Client"){
                controller.isClient=true;
                controller.isTrans =false;
                Get.find<verificationCodeController>().isClient=true;
                 Get.find<verificationCodeController>().istrans=false;
                
               }
               else{
                controller.isTrans=true;
                controller.isClient = false;
                  Get.find<verificationCodeController>().isClient=false;
                 Get.find<verificationCodeController>().istrans=true;
               }
                
               
              Get.to(()=>  const Signin());
            },
            child: Container(
              height: Dimenssions.height10*5,
              width: Dimenssions.width30*9,
              decoration: BoxDecoration(
                color:AppColors.buttonColor,
                borderRadius: BorderRadius.circular(Dimenssions.radius10)
              ),
              child:   Center(
                child:  Text(text, style:const  TextStyle(
                  color: AppColors.insidetextcolor
                ),),
              ),
            ),
          );
          });
         }  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: Dimenssions.height20*30,
              width: Dimenssions.width,
              child: LottieBuilder.asset("assets/animations/animation4.json")),
             SizedBox(height: Dimenssions.height10*6,),
         
            button("Client"),
            SizedBox(height: Dimenssions.height20,),
            button("Transporter"),
          
          
        
          
          ],
        ),
      ),
    );
  }
}