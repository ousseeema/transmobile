import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class TransOuClient extends StatelessWidget {
  const TransOuClient({super.key});

         Widget button(text){
          return Container(
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
          );
         }  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
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
    );
  }
}