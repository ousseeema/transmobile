import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/detailsResult.dart';
import 'package:transmobile/view/components/Costumedetailsinfo.dart';
import 'package:transmobile/view/components/animatedtext.dart';
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
                        // if  the length list is <3 then affiche the existant list
           controller.SelectedTrip!.transporter.parsols ?  controller.SelectedTrip!.transporter.parsolsSite.length< 4 
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
                                "Parcels Sites: ${controller.SelectedTrip!.transporter.parsolsSite.sublist(3,controller.SelectedTrip!.transporter.parsolsSite.length-1 )},")),
                  
                  ],
                ): SizedBox(height: Dimenssions.height10,),
                // address for parcles
                 controller.SelectedTrip!.transporter.parsols ?CostumeInfoDetails(
                    icon: const Icon(Icons.location_on_outlined),
                    text: CostumeAnimatedText(
                        text:
                            "Parcels Address: ${controller.SelectedTrip!.transporter.Adresse_Parsols}")): SizedBox(height: Dimenssions.height10,), 

           ],
        ),
      );
    });
  }
}
