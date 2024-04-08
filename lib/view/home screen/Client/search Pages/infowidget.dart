import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/view/components/Costumedetailsinfo.dart';
import 'package:transmobile/view/components/animatedtext.dart';
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
                    text: CostumeAnimatedText(
                        text:
                            "Email :${controller.SelectedTrip!.transporter.email}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                CostumeInfoDetails(
                    icon: const Icon(BoxIcons.bx_world,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "Local Country: ${controller.SelectedTrip!.transporter.listCountry1}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                // local number
                CostumeInfoDetails(
                    icon: const Icon(BoxIcons.bx_world,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "Local Number: ${controller.SelectedTrip!.transporter.phoneNumberA}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                // second phone number
                CostumeInfoDetails(
                    icon: const Icon(Icons.phone, color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "second Number: ${controller.SelectedTrip!.transporter.phoneNumberB}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                // parcles true or false
                CostumeInfoDetails(
                    icon: const Icon(BoxIcons.bx_world,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "Parcles: ${controller.SelectedTrip!.transporter.parsols.toString()}")),
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
                                icon: const Icon(Icons.place_outlined,
                                    color: AppColors.iconColor),
                                text: CostumeAnimatedText(
                                    text:
                                        "Parcels Sites: ${controller.SelectedTrip!.transporter.parsolsSite}")),
                         SizedBox(height: Dimenssions.height20,)
                          ],
                        )
                        //if the list is sup the 3 element then do column and divide the lsit in 2 and display each in diffrent ligne
                        : Column(
                            children: [
                              CostumeInfoDetails(
                                  icon: const Icon(Icons.place_outlined,
                                      color: AppColors.iconColor),
                                  text: CostumeAnimatedText(
                                      text:
                                          "Parcels Sites: ${controller.SelectedTrip!.transporter.parsolsSite[0]},${controller.SelectedTrip!.transporter.parsolsSite[1]},${controller.SelectedTrip!.transporter.parsolsSite[3]}")),
                             SizedBox(height: Dimenssions.height20,),
                              CostumeInfoDetails(
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
                            icon: const Icon(Icons.location_on_outlined,
                                color: AppColors.iconColor),
                            text: CostumeAnimatedText(
                                text:
                                    "Parcels Address: ${controller.SelectedTrip!.transporter.Adresse_Parsols}")),
                     SizedBox(height: 
                     Dimenssions.height20,)
                      ],
                    )
                    : const SizedBox(),

                // price for kg
                CostumeInfoDetails(
                    icon: const Icon(BoxIcons.bx_dollar_circle,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "Price/kg: ${controller.SelectedTrip!.transporter.priceKg}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                // home pickups and delivery
                CostumeInfoDetails(
                    icon: const Icon(BoxIcons.bx_transfer,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "Home Pickups/Delivery: ${controller.SelectedTrip!.transporter.homePickUps.toString()}/ ${controller.SelectedTrip!.transporter.homeDelivery.toString()}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                CostumeInfoDetails(
                    icon: const Icon(EvaIcons.car_outline,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "Car Model: ${controller.SelectedTrip!.transporter.carBrand}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                // car plate
                CostumeInfoDetails(
                    icon: const Icon(Icons.numbers_outlined,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "Car Plate: ${controller.SelectedTrip!.transporter.carSerieNumber}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                Container(
                    height: Dimenssions.height10 * 5,
                    width: Dimenssions.width30 * 9,
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius:
                            BorderRadius.circular(Dimenssions.radius10)),
                    child: Center(
                        child: CostumeAnimatedText(
                      text: "Send a request",
                      color: AppColors.insidetextcolor,
                    ))),
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
