// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:transmobile/controller/infoController/informationcontroller.dart';
import 'package:transmobile/view/splashscreens/transOuclient.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class informations extends StatefulWidget {
  const informations({super.key});

  @override
  State<informations> createState() => _informationsState();
}

class _informationsState extends State<informations> {
  final PageController _pagecontroller = PageController();
  Widget _informations(image, bigtext, smalltext, index) {
    return Column(
      children: [
        Container(
          height: Dimenssions.height20 * 25,
          width: Dimenssions.width20 * 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimenssions.radius30),
              ),
          child: Lottie.asset(image),
        ),
        SizedBox(
          height:Dimenssions.height10*3,
        ),
        Text(bigtext, style:  const TextStyle(
          color: AppColors.mainTextColor,

        ),),
        SizedBox(
          height: Dimenssions.height20,
        ),
         Text(smalltext, style: const TextStyle(
          color: AppColors.mainTextColor,

        ),),
        SizedBox(
          height: Dimenssions.height20*2,
        ),
        index < 2 ?  Icon(
          Icons.arrow_forward, size: Dimenssions.icon24+4,
          color: AppColors.iconColor ,
          ) 
        : GestureDetector(
          onTap: () {
            // going to the next page trans ou client 
            Get.to(()=> const TransOuClient());
          },
          child: Container(
            height: Dimenssions.height10*5,
            width: Dimenssions.width30*9,
            decoration: BoxDecoration(
              color:AppColors.buttonColor,
              borderRadius: BorderRadius.circular(Dimenssions.radius10)
            ),
            child:  const Center(
              child:  Text("Get Started", style: TextStyle(
                color: AppColors.insidetextcolor
              ),),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<InformationController>(
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: Dimenssions.height20,
                  ),
                  SizedBox(
                    height: Dimenssions.height-Dimenssions.height20,
                    width: Dimenssions.width,
                    child: PageView.builder(
                        controller: _pagecontroller,
                        itemCount: controller.listAnimation.length,
                        itemBuilder: (_, index) {
                          return _informations(
                              controller.listAnimation[index],
                              controller.listOfbigtext[index],
                              controller.listofsmalltext[index],
                              index);
                        }),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
