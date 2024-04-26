import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/components/Costumedetailsinfo.dart';
import 'package:transmobile/view/components/animatedtext.dart';
import 'package:transmobile/view/utils/appConstant.dart';
import 'package:transmobile/view/utils/colors.dart';
import 'package:transmobile/view/utils/dimenssion.dart';

class HistoryDetails extends StatelessWidget {
  const HistoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SettingController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Dimenssions.height20,
                ),
                CostumeAnimatedText(text: "History Details"),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                //! display the package image
                Container(
                  margin: EdgeInsets.only(
                      left: Dimenssions.LRpadmarg20,
                      right: Dimenssions.LRpadmarg20),
                  height: Dimenssions.height20 * 10,
                  width: Dimenssions.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimenssions.radius20),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "${AppConstant.Packagesimage}${controller.selectedDemande!.message.packagephoto}"))),
                ),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                CostumeInfoDetails(
                    icon: const Icon(
                      Icons.email_outlined,
                      color: AppColors.iconColor,
                    ),
                    text1: "Transporter Name  :",
                    text: CostumeAnimatedText(
                        text:
                            " ${controller.selectedDemande!.transporter.fullName}")),
                             SizedBox(
                  height: Dimenssions.height20,
                ),
                CostumeInfoDetails(
                    icon: const Icon(
                      Icons.email_outlined,
                      color: AppColors.iconColor,
                    ),
                    text1: "Email :",
                    text: CostumeAnimatedText(
                        text:
                            " ${controller.selectedDemande!.transporter.email
                            }")),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                CostumeInfoDetails(
                    text1: "Local Country:",
                    icon: const Icon(BoxIcons.bx_world,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.selectedDemande!.transporter.listCountry1}")),
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
                            "${controller.selectedDemande!.message.Pickupaddress}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                // local number
                CostumeInfoDetails(
                    text1: "Local Number: ",
                    icon: const Icon(Icons.phone_sharp,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.selectedDemande!.message.phoneNumberof_the_sender}")),
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
                            "${controller.selectedDemande!.message.receivedAdress}")),

                SizedBox(
                  height: Dimenssions.height20,
                ),
                CostumeInfoDetails(
                    text1: "PickUp Address:",
                    icon: const Icon(Icons.location_on_outlined,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.selectedDemande!.message.Pickupaddress}")),

                SizedBox(
                  height: Dimenssions.height20,
                ),

                // second phone number of the reciver
                CostumeInfoDetails(
                    text1: "Destination Number: ",
                    icon: const Icon(Icons.phone, color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.selectedDemande!.message.phoneNumberof_the_receiver}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                // parcles true or false
                CostumeInfoDetails(
                    text1: "Parcles:",
                    icon:
                        const Icon(BoxIcons.bx_box, color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.selectedDemande!.transporter.parsols.toString()}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                // price for kg
                CostumeInfoDetails(
                    text1: "Price/kg: ",
                    icon: const Icon(BoxIcons.bx_dollar_circle,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.selectedDemande!.transporter.priceKg}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),
                // home pickups and delivery
                CostumeInfoDetails(
                    text1: "User Home Pickups/Delivery:",
                    icon: const Icon(BoxIcons.bx_transfer,
                        color: AppColors.iconColor),
                    text: CostumeAnimatedText(
                        text:
                            "${controller.selectedDemande!.message.homepickup.toString()}/ ${controller.selectedDemande!.message.homedelivery.toString()}")),
                SizedBox(
                  height: Dimenssions.height20,
                ),

                CostumeInfoDetails(
                  
                     text1: "Number of Kg: ",
                     icon: const Icon(Icons.numbers,
                        color: AppColors.iconColor),
                     text: CostumeAnimatedText(
                        text:
                            "${controller.selectedDemande!.message.numberofkg}")),
                
                
               ],
            ),
          );
        }),
      ),
    );
  }
}
