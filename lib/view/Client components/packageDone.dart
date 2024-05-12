import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/view/home%20screen/Client/ClientMainScreens.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class PackageDone extends StatelessWidget {
  const PackageDone({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: Dimenssions.height10,),
              Row(
               children: [
                SizedBox(width: Dimenssions.width20,),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back_rounded))
               ],
              ),
              SizedBox(height: Dimenssions.height20*3,),
              SizedBox(
                height: Dimenssions.height20*15,
                width: Dimenssions.width,
                child: LottieBuilder.asset("assets/animations/donee.json",
                height: Dimenssions.height20*15,
                ),),
              SizedBox(height: Dimenssions.height20*4,),
              AnimatedTextKit(animatedTexts: 
              [
        ColorizeAnimatedText(
          'Your request has been \n      successfully sent',
          textStyle:const TextStyle(
          fontSize:20,
          
        ) ,
          colors: [
            Colors.black,
          Colors.grey,
          Colors.grey[200]!,
          Colors.black12,
          ],
        ),
              ]),
              SizedBox(height: Dimenssions.height20*7,),

              GestureDetector(
                onTap: () {
                   // ! back to home screen
                   Get.offAll(()=> const ClientMainScreens());
                  
                },
                child: Container(
                  height: Dimenssions.height10 * 5,
                  width: Dimenssions.width30 * 9,
                  decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius:
                          BorderRadius.circular(Dimenssions.radius10)),
                  child: const Center(
                    child: Text(
                      "Back to home",
                      style: TextStyle(color: AppColors.insidetextcolor),
                    ),
                  ),
                ),
              ),

      
            ],

          ),
        ),
      ),
    );
  }
}