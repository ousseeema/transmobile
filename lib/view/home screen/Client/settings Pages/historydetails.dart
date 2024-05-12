import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:transmobile/controller/homeScreen/Client/settingsController.dart';
import 'package:transmobile/view/Client%20components/Costumedetailsinfo.dart';
import 'package:transmobile/view/Client%20components/animatedtext.dart';
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
                Row(
                  children: [
                    SizedBox(width: Dimenssions.width30,),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back_rounded)),
                    SizedBox(width: Dimenssions.width30*3.5,),
                    CostumeAnimatedText(text: "History Details"),
                  ],
                ),
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
                Container(
                  margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                      icon: const Icon(
                        Icons.email_outlined,
                        color: AppColors.iconColor,
                      ),
                      text1: "Transporter Name  :",
                      text: CostumeAnimatedText(
                          text:
                              " ${controller.selectedDemande!.transporter.fullName}")),
                ),
                             SizedBox(
                  height: Dimenssions.height10/2,
                ),
                Container(
                   margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                      icon: const Icon(
                        Icons.email_outlined,
                        color: AppColors.iconColor,
                      ),
                      text1: "Email :",
                      text: CostumeAnimatedText(
                          text:
                              " ${controller.selectedDemande!.transporter.email
                              }")),
                ),
                SizedBox(
                  height: Dimenssions.height10/2,
                ),
                Container(
                   margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                      text1: "Local Country:",
                      icon: const Icon(BoxIcons.bx_world,
                          color: AppColors.iconColor),
                      text: CostumeAnimatedText(
                          text:
                              "${controller.selectedDemande!.transporter.listCountry1}")),
                ),
                SizedBox(
                  height: Dimenssions.height10/2,
                ),
                // local address
                Container(
                   margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                      text1: "Local Address:",
                      icon: const Icon(Icons.location_on_outlined,
                          color: AppColors.iconColor),
                      text: CostumeAnimatedText(
                          text:
                              "${controller.selectedDemande!.message.Pickupaddress}")),
                ),
                SizedBox(
                  height:Dimenssions.height10/2,
                ),

                // local number
                Container(
                   margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                      text1: "Local Number: ",
                      icon: const Icon(Icons.phone_sharp,
                          color: AppColors.iconColor),
                      text: CostumeAnimatedText(
                          text:
                              "${controller.selectedDemande!.message.phoneNumberof_the_sender}")),
                ),
                SizedBox(
                  height: Dimenssions.height10/2,
                ),

                // destination country
                Container(
                   margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                      text1: "Destination Country:",
                      icon: const Icon(BoxIcons.bx_world,
                          color: AppColors.iconColor),
                      text: CostumeAnimatedText(
                          text:
                              "${controller.selectedDemande!.message.receivedAdress}")),
                ),

                SizedBox(
                  height: Dimenssions.height10/2,
                ),
                Container(
                   margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                      text1: "PickUp Address:",
                      icon: const Icon(Icons.location_on_outlined,
                          color: AppColors.iconColor),
                      text: CostumeAnimatedText(
                          text:
                              "${controller.selectedDemande!.message.Pickupaddress}")),
                ),

                SizedBox(
                  height: Dimenssions.height10/2,
                ),

                // second phone number of the reciver
                Container(
                   margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                      text1: "Destination Number: ",
                      icon: const Icon(Icons.phone, color: AppColors.iconColor),
                      text: CostumeAnimatedText(
                          text:
                              "${controller.selectedDemande!.message.phoneNumberof_the_receiver}")),
                ),
                SizedBox(
                  height:Dimenssions.height10/2,
                ),

                // parcles true or false
                Container(
                   margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                      text1: "Parcles:",
                      icon:
                          const Icon(BoxIcons.bx_box, color: AppColors.iconColor),
                      text: CostumeAnimatedText(
                          text:
                              "${controller.selectedDemande!.transporter.parsols.toString()}")),
                ),
                SizedBox(
                  height: Dimenssions.height10/2,
                ),

                // price for kg
                Container(
                   margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                      text1: "Price/kg: ",
                      icon: const Icon(BoxIcons.bx_dollar_circle,
                          color: AppColors.iconColor),
                      text: CostumeAnimatedText(
                          text:
                              "${controller.selectedDemande!.transporter.priceKg}")),
                ),
                SizedBox(
                  height:Dimenssions.height10/2,
                ),
                // home pickups and delivery
                Container(
                   margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                      text1: "Home Pickups/Delivery:",
                      icon: const Icon(BoxIcons.bx_transfer,
                          color: AppColors.iconColor),
                      text: CostumeAnimatedText(
                          text:
                              "${controller.selectedDemande!.message.homepickup.toString()}/ ${controller.selectedDemande!.message.homedelivery.toString()}")),
                ),
                SizedBox(
                  height: Dimenssions.height10/2,
                ),

                Container(
                   margin: EdgeInsets.only(left: Dimenssions.LRpadmarg10, right:  Dimenssions.LRpadmarg10,top:  Dimenssions.LRpadmarg10),
                  padding: EdgeInsets.only(
                    left: Dimenssions.LRpadmarg20
                  ),
                  height: Dimenssions.height20*2.5,
                  width: Dimenssions.width,
                  decoration: BoxDecoration( 
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(Dimenssions.radius10)
                  ),
                  child: CostumeInfoDetails(
                    
                       text1: "Number of Kg: ",
                       icon: const Icon(Icons.numbers,
                          color: AppColors.iconColor),
                       text: CostumeAnimatedText(
                          text:
                              "${controller.selectedDemande!.message.numberofkg}")),
                ),
                
                SizedBox(
                  height: Dimenssions.height20*4,
                )
               ],
            ),
          );
        }),
      ),
    );
  }
}
