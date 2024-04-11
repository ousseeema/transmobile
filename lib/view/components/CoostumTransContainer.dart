// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/controller/homeScreen/Client/resultController.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class CostumTransContainer extends StatelessWidget {
  String id;
  String TransName;
  String imagename;
  bool parcels;
  var price;
  String depart;
  String dateDepart;
  String Destination;
  String destinationDate;
  int index;

  CostumTransContainer(
      {super.key,
      required this.index,
      required this.id,
      required this.TransName,
      required this.imagename,
      required this.depart,
      required this.dateDepart,
      required this.Destination,
      required this.destinationDate,
      required this.parcels,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultController>(builder: (controller){
      return  Padding(
      padding: EdgeInsets.all(Dimenssions.height10),
      child: GestureDetector(
        onTap: () {
        Get.find<DetailsResult>().selectedtrip(controller.tripsafterFilter[index]);

        },
        child: Container(
          height: Dimenssions.height20 * 10,
          width: Dimenssions.width - Dimenssions.width10,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(4, 8), // changes position of shadow
                ),
              ],
              color: Colors.grey,
              borderRadius: BorderRadius.circular(Dimenssions.radius20)),
          child: Row(
            children: [
              // column for the image and the pricce per kg
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: Dimenssions.height20 * 1.5,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          100), // Adjust the radius to match the container's borderRadius
                      child: Image.network(
                        "${AppConstant.Transimage}/${imagename}",
                        fit: BoxFit.cover,
                        height: Dimenssions.height20 * 3,
                        width: Dimenssions.width30 * 2,
                      ),
                    ),
                    SizedBox(
                      height: Dimenssions.height10,
                    ),
                    CostumeAnimatedText(
                      color: Colors.white, 
                      text: "${price} per/kg",
                      fontSize: Dimenssions.font20 - 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Dimenssions.width20,
              ),
              // column for the name and the destination
              Column(
                children: [
               
                  SizedBox(
                    height: Dimenssions.height20 * 1.5,
                  ),

                  AnimatedTextKit(repeatForever: true, animatedTexts: [
                      ColorizeAnimatedText(TransName,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimenssions.font20 - 4),
                          colors: [
                            Colors.purple,
                            Colors.blue,
                            Colors.yellow,
                            Colors.red,
                          ])
                    ]),
                  
                  SizedBox(
                    height: Dimenssions.height20,
                  ),
                  Row(
                    children: [
                        
                       const Icon(Icons.flight_takeoff_rounded),
                       SizedBox(width: Dimenssions.width10,),
                      CostumeAnimatedText(color: Colors.white, text: depart),
                      SizedBox(
                        width: Dimenssions.width10,
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.iconColor,
                        size: Dimenssions.icon24,
                      ),
                      SizedBox(
                        width: Dimenssions.width10,
                      ),
                      CostumeAnimatedText(color: Colors.white, text: Destination),
                       SizedBox(width: Dimenssions.width10,),
                        const Icon(Icons.flight_land_rounded),
                    ],
                  ),
                  SizedBox(
                    height: Dimenssions.height10,
                  ),
                  Row(
                    children: [
                      CostumeAnimatedText(
                          color: Colors.white,
                          text: dateDepart.toString().substring(0, 10)),
                      SizedBox(
                        width: Dimenssions.width20,
                      ),
                      CostumeAnimatedText(
                          color: Colors.white,
                          text: destinationDate.toString().substring(0, 10)),
                    ],
                  ),
                  SizedBox(height: Dimenssions.height10,),
                  Row(
                    children: [
                      AnimatedTextKit(repeatForever: true, animatedTexts: [
                      ColorizeAnimatedText('Tap to see more',
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Dimenssions.font20 - 4),
                          colors: [
                            Colors.white,
                           
                            Colors.deepOrange,
                            Colors.lightBlue,
                          ])
                    ]),
                    
                      SizedBox(width: Dimenssions.width10,),
                     const  Icon(Icons.touch_app_rounded, color: AppColors.iconColor,)
                    ],
                  )
                ],
              ),
        
              // button swip
              
             
            ],
          ),
        ),
      ),
    );
    });
  }
}
