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
        child: Column(
          children: [
            // email
            CostumeInfoDetails(
                icon: const Icon(Icons.email_outlined),
                text: CostumeAnimatedText(
                    text:
                        "Email :${controller.SelectedTrip!.transporter.email}")),
            CostumeInfoDetails(
                icon: const Icon(BoxIcons.bx_world),
                text: CostumeAnimatedText(
                    text:
                        "Local Country: ${controller.SelectedTrip!.transporter.listCountry1}")),
            // local number
            CostumeInfoDetails(
                icon: const Icon(BoxIcons.bx_world),
                text: CostumeAnimatedText(
                    text:
                        "Local Number: ${controller.SelectedTrip!.transporter.phoneNumberA}")),
            // second phone number
            CostumeInfoDetails(
                icon: const Icon(Icons.phone),
                text: CostumeAnimatedText(
                    text:
                        "second Number: ${controller.SelectedTrip!.transporter.phoneNumberB}")),
            // parcles true or false
            CostumeInfoDetails(
                icon: const Icon(BoxIcons.bx_world),
                text: CostumeAnimatedText(
                    text:
                        "Parcles: ${controller.SelectedTrip!.transporter.parsols.toString()}")),
            // if  the length list is <3 then affiche the existant list and if the transporter is accepting parcels
            controller.SelectedTrip!.transporter.parsols
                ? controller.SelectedTrip!.transporter.parsolsSite.length < 4
                    ? CostumeInfoDetails(
                        icon: const Icon(Icons.place_outlined),
                        text: CostumeAnimatedText(
                            text:
                                "Parcels Sites: ${controller.SelectedTrip!.transporter.parsolsSite}"))
                    //if the list is sup the 3 element then do column and divide the lsit in 2 and display each in diffrent ligne
                    : Column(
                        children: [
                          CostumeInfoDetails(
                              icon: const Icon(Icons.place_outlined),
                              text: CostumeAnimatedText(
                                  text:
                                      "Parcels Sites: ${controller.SelectedTrip!.transporter.parsolsSite[0]},${controller.SelectedTrip!.transporter.parsolsSite[1]},${controller.SelectedTrip!.transporter.parsolsSite[3]}")),
                          CostumeInfoDetails(
                              icon: const Icon(Icons.place_outlined),
                              text: CostumeAnimatedText(
                                  text:
                                      "Parcels Sites: ${controller.SelectedTrip!.transporter.parsolsSite.sublist(3, controller.SelectedTrip!.transporter.parsolsSite.length - 1)},")),
                        ],
                      )
                : SizedBox(
                    height: Dimenssions.height10,
                  ),
            // address for parcles  if the transporteur has accepted parcels
            controller.SelectedTrip!.transporter.parsols
                ? CostumeInfoDetails(
                    icon: const Icon(Icons.location_on_outlined),
                    text: CostumeAnimatedText(
                        text:
                            "Parcels Address: ${controller.SelectedTrip!.transporter.Adresse_Parsols}"))
                : SizedBox(
                    height: Dimenssions.height10,
                  ),
            // price for kg
            CostumeInfoDetails(
                icon: const Icon(BoxIcons.bx_dollar_circle),
                text: CostumeAnimatedText(
                    text:
                        "Price/kg: ${controller.SelectedTrip!.transporter.priceKg}")),
                        // home pickups and delivery
                         CostumeInfoDetails(
                icon: const Icon(BoxIcons.bx_transfer),
                text: CostumeAnimatedText(
                    text:
                        "Home Pickups/Delivery: ${controller.SelectedTrip!.transporter.homePickUps.toString()}/ ${controller.SelectedTrip!.transporter.homeDelivery.toString()}")),
                       
                        CostumeInfoDetails(
                icon: const Icon(EvaIcons.car_outline),
                text: CostumeAnimatedText(
                    text:
                        "Car Model: ${controller.SelectedTrip!.transporter.carBrand}")),
                        // car plate 
                        CostumeInfoDetails(
                icon: const Icon(Icons.numbers_outlined),
                text: CostumeAnimatedText(
                    text:
                        "Car Plate: ${controller.SelectedTrip!.transporter.carSerieNumber}")),

                        Container(
                          height: Dimenssions.height10 * 5,
                  width: Dimenssions.width30 * 9,
                  decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius:
                          BorderRadius.circular(Dimenssions.radius10)),
                          child: CostumeAnimatedText(text: "Send a request", color:  AppColors.insidetextcolor,)
                        )
                        
                        
          ],
        ),
      );
    });
  }
}
