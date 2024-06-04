// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/view/Client%20components/Costumedetailsinfo.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
import 'package:transmobile/view/home%20screen/Client/search%20Pages/sendRequest.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class infoWidget extends StatefulWidget {
  const infoWidget({super.key});

  @override
  State<infoWidget> createState() => _infoWidgetState();
}

class _infoWidgetState extends State<infoWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsResult>(builder: (controller) {
      return SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: Dimenssions.LRpadmarg10 * 2,
                top: Dimenssions.TBpadmarg20),
            child: Column(
              children: [
                // email
                CostumeInfoDetails(
                    icon: const Icon(
                      Icons.email_outlined,
                      color: AppColors.iconColor,
                    ),
                    text1:"Email :" ,
                    text: CostumeAnimatedText(
                        text:
                            " ${controller.SelectedTrip!.transporter.email}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                CostumeInfoDetails(
                  text1: "Local Country:",
                    icon: const Icon(BoxIcons.bx_world,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.SelectedTrip!.transporter.listCountry1}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                // local address
                CostumeInfoDetails(
                  text1: "Local Address:",
                    icon: const Icon(Icons.location_on_outlined,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.SelectedTrip!.transporter.localAddress}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                // local number
                CostumeInfoDetails(
                  text1:"Local Number: " ,
                    icon: const Icon(Icons.phone_sharp,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.SelectedTrip!.transporter.phoneNumberA}")),
                SizedBox(
                  height: Dimenssions.height20,
                ), 
               

                // destination country
                CostumeInfoDetails(
                  text1: "Destination Country:",
                    icon: const Icon(BoxIcons.bx_world,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.SelectedTrip!.transporter.listCountry2}")),
                
               SizedBox(
                  height: Dimenssions.height20,
                ),
                 CostumeInfoDetails(
                  text1: "Destination Address:",
                    icon: const Icon(Icons.location_on_outlined,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.SelectedTrip!.transporter.DestinationAddress}")),
                
               SizedBox(
                  height: Dimenssions.height20,
                ),







                // second phone number
                CostumeInfoDetails(
                  text1: "Destination Number: ",
                    icon: const Icon(Icons.phone, color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.SelectedTrip!.transporter.phoneNumberB}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                    
                // parcles true or false
                CostumeInfoDetails(
                  text1:"Parcles:" ,
                    icon: const Icon(BoxIcons.bx_box,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.SelectedTrip!.transporter.parsols.toString()}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                // if  the length list is <3 then affiche the existant list and if the transporter is accepting parcels
                controller.SelectedTrip!.transporter.parsols
                    ? controller.SelectedTrip!.transporter.parsolsSite.length <
                            4
                        ? Column(
                          children: [
                            CostumeInfoDetails(
                              text1: "Parcels Sites:",
                                icon: const Icon(Icons.place_outlined,
                                    color: AppColors.iconColor),
                                text: CostumeAnimatedText(
                                    text:
                                        "${controller.SelectedTrip!.transporter.parsolsSite}")),
                         SizedBox(height: Dimenssions.height20,)
                          ],
                        )
                        //if the list is sup the 3 element then do column and divide the lsit in 2 and display each in diffrent ligne
                        : Column(
                            children: [
                              CostumeInfoDetails(
                                text1:"Parcels Sites: " ,
                                  icon: const Icon(Icons.place_outlined,
                                      color: AppColors.iconColor),
                                  text: CostumeAnimatedText(
                                      text:
                                          "${controller.SelectedTrip!.transporter.parsolsSite[0]},${controller.SelectedTrip!.transporter.parsolsSite[1]},${controller.SelectedTrip!.transporter.parsolsSite[3]}")),
                             SizedBox(height: Dimenssions.height20,),
                              CostumeInfoDetails(
                                text1: "Parcels Sites: ",
                                  icon: const Icon(Icons.place_outlined,
                                      color: AppColors.iconColor),
                                  text: CostumeAnimatedText(
                                      text:
                                          "Parcels Sites: ${controller.SelectedTrip!.transporter.parsolsSite.sublist(3, controller.SelectedTrip!.transporter.parsolsSite.length - 1)},")),
                            SizedBox(height: Dimenssions.height20,)
                            ],
                          )
                    : const SizedBox(),
                // address for parcles  if the transporteur has accepted parcels
                controller.SelectedTrip!.transporter.parsols
                    ? Column(
                      children: [
                        CostumeInfoDetails(
                          text1: "Parcels Address: ",
                            icon: const Icon(Icons.location_on_outlined,
                                color: AppColors.iconColor),
                            text: CostumeAnimatedText(
                                text:
                                    "${controller.SelectedTrip!.transporter.Adresse_Parsols}")),
                     SizedBox(height: 
                     Dimenssions.height20,)
                      ],
                    )
                    : const SizedBox(),

                // price for kg
                CostumeInfoDetails(
                  text1: "Price/kg: ",
                    icon: const Icon(BoxIcons.bx_dollar_circle,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.SelectedTrip!.transporter.priceKg}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                // home pickups and delivery
                CostumeInfoDetails(
                  text1: "Home Pickups/Delivery:",
                    icon: const Icon(BoxIcons.bx_transfer,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            " ${controller.SelectedTrip!.transporter.homePickUps.toString()}/ ${controller.SelectedTrip!.transporter.homeDelivery.toString()}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                CostumeInfoDetails(
                  text1:"Car Model: " ,
                    icon: const Icon(EvaIcons.car_outline,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.SelectedTrip!.transporter.carBrand}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                // car plate
                CostumeInfoDetails(
                  text1: "Car Plate: ",
                    icon: const Icon(Icons.numbers_outlined,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.SelectedTrip!.transporter.carSerieNumber}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                
               controller.SelectedTrip!.citys.isEmpty? 
               SizedBox(height: Dimenssions.height20,) :
                GestureDetector(
                  onTap: () {
                    Get.to(()=> const SendRequest());
                  },
                  child: Container(
                      height: Dimenssions.height10 * 5,
                      width: Dimenssions.width30 * 9,
                      decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius:
                              BorderRadius.circular(Dimenssions.radius10)),
                      child:const  Center(
                          child: Text("Send a request", style: TextStyle(
                            color: AppColors.insidetextcolor
                          ),))),
                ),
                SizedBox(
                  height: Dimenssions.height20 * 2,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
